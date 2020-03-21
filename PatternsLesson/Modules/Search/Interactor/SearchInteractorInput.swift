//
//  SearchInteractorInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchInteractorInput {
    
    /// tells interactor to obtain point-of-interest places
    /// - Parameter city: city where places should be located
    func obtainPlacesBy(city: String)
    /// tells interactor that user pressed logout button
    func didPressLogoutButton()
}
