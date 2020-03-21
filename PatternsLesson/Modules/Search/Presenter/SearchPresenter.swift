//
//  SearchPresenter.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class SearchPresenter: SearchViewOutput, SearchInteractorOutput {
        
    weak var view: SearchViewInput!
    var interactor: SearchInteractorInput!
    var dataSource: SearchDataSource!
    var router: SearchRouterInput!
    
    //MARK: - View Output
    func didSelectItem(with cityName: String) {
        
        view.displayLoadingView()
        interactor.obtainPlacesBy(city: cityName)
    }
    
    func handleError(error: Error) {
        
        view.displayInitialMessage()
        router.showErrorAlert(error: error)
    }
    
    func initialSetup() {
        
        view.setUpSearchController()
        view.setupCustomBackButton()
        view.displayInitialMessage()
        view.connectDataSource(dataSource)
    }
    
    func didPressLogoutButton() {
        interactor.didPressLogoutButton()
    }
    
    //MARK: - Interactor Output
    func didFinishObtainingPlaces(places: [PlaceResult]) {
        
        var models: [PlaceModel] = []
    
        for result in places {
            
            let name = result.name
            let rating = "Rating: \(result.rating)"
            var photoUrl = String()
            
            if let photo = result.photos?.first {
                photoUrl = Endpoints.imageUrl(reference: photo.photoReference)
            }
            
            models.append(PlaceModel(name: name, rating: rating, photoUrl: photoUrl))
        }
        
        dataSource.places = models
        view.reloadData()
        
        if !places.isEmpty {
            view.displayTableView()
        }
        else {
            view.displayNoResultsMessage()
        }
    }
    
    func finishedObtainingWithError(error: Error) {
        
        view.displayInitialMessage()
        router.showErrorAlert(error: error)
    }
    
    func didFinishLoggingOut() {
        router.popSearchController()
    }
}
