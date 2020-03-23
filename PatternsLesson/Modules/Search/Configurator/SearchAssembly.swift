//
//  SearchAssembly.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import GooglePlaces

class SearchAssembly {
    
    class func configure() -> UIViewController  {
        
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        let dataSource = SearchDataSource()
        let placesService = PlaceManager()
        let logoutService = AuthManager()
        
        view.filter = GMSAutocompleteFilter()
        view.resultsController = GMSAutocompleteResultsViewController()
        view.output = presenter
        
        interactor.placeManager = placesService
        interactor.authManager = logoutService
        interactor.output = presenter
        
        presenter.view = view
        presenter.dataSource = dataSource
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = view
        
        return view
    }
}
