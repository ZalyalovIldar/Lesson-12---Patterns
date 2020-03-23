//
//  SearchSearchInteractor.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import Foundation

protocol SearchInteractorOutput: AnyObject {    
    /// notify presenter that places got
    /// - Parameter result: result with of getting places
    func placesGotWith(result: Result<Response, Error>)
    
    /// notify presenter that user is logged out now
    func finishedLogout()
}

protocol SearchInteractorInput {
    /// notify interactor to get interesting places
    /// - Parameter city: city where will find places
    func getPlacesIn(city: String)
    
    /// notify interactor that user wants to logout
    func logoutButtonPressed()
}


class SearchInteractor: SearchInteractorInput {
    
    var placeManager: PlaceManager!
    var authManager: AuthManager!
    
    weak var output: SearchInteractorOutput!
    
    func getPlacesIn(city: String) {
        
        placeManager.getPlacesIn(city: city) { [weak self] result in
            
            self?.output.placesGotWith(result: result)
        }
    }
    
    func logoutButtonPressed() {
        authManager.logout()
        output.finishedLogout()
    }
}
