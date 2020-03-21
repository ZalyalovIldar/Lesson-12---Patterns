//
//  SearchInteractor.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInput {
    
    var placesService: PlacesService!
    var logoutService: LogoutService!
    /// interactor output
    weak var presenter: SearchInteractorOutput!
    
    func obtainPlacesBy(city: String) {
        
        placesService.getPlacesBy(city: city) { [weak self] result in
            
            self?.presenter.didFinishObtainingPlaces(result: result)
        }
    }
    
    func didPressLogoutButton() {
        
        logoutService.logout()
        presenter.didFinishLoggingOut()
    }
}
