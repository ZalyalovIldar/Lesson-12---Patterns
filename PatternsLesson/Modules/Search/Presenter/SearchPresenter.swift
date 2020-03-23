//
//  SearchSearchPresenter.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

class SearchPresenter: SearchViewOutput, SearchInteractorOutput {
    
    weak var view: SearchViewInput!
    
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!
    var dataSource: SearchDataSource!
    
    //MARK: - SearchViewOutput
    func selectedCity(with cityName: String) {
        interactor.getPlacesIn(city: cityName)
    }
    
    func handle(error: Error) {
        router.showAlertWith(error: error)
    }
    
    func initialSetUP() {
        
        view.initBackButton()
        view.initSearchController()
        
        view.connectData(source: dataSource)
    }
    
    func logoutButtonPressed() {
        interactor.logoutButtonPressed()
    }
    
    //MARK: - SearchInteractorOutput
    func placesGotWith(result: Result<Response, Error>) {
                        
        switch result {
            
        case .success(let response):
            
            var placesArray = [Place]()
            
            var photoUrl = ""
            
            response.places.forEach({ place in
                
                if let placePhoto = place.photos?.first {
                    photoUrl = PlaceManager.getImageUrl(photoReference: placePhoto.reference)
                }
                
                placesArray.append(Place(name: place.name, photoUrl: photoUrl))
            })
            
            dataSource.placesArray = placesArray
            view.reloadTableView()
            
            guard !placesArray.isEmpty else { return }
            
            view.initTableView()
            
        case .failure(let error):
            router.showAlertWith(error: error)
        }
    }
    
    func finishedLogout() {
        router.dismissSearchController()
    }
}
