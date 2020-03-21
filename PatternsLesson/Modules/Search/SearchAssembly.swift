//
//  SearchAssembly.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

class SearchAssembly {
    
    /// injects all dependencies and returns viewcontroller
    class func configureModule() -> UIViewController {
        
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let dataSource = SearchDataSourceImpl()
        let router = SearchRouter()
        let placesService = PlacesServiceImpl()
        let logoutService = LogoutServiceImpl()
        
        view.presenter = presenter
        view.filter = GMSAutocompleteFilter()
        view.resultsViewController = GMSAutocompleteResultsViewController()
        
        presenter.view = view
        presenter.dataSource = dataSource
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.placesService = placesService
        interactor.logoutService = logoutService
                
        router.view = view
        
        placesService.session = URLSession.shared
        logoutService.userDefaults = UserDefaults.standard
        
        return view
    }
}
