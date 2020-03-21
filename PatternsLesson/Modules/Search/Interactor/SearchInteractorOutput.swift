//
//  SearchInteractorOutput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchInteractorOutput: AnyObject {
    
    /// tells presenter that places are obtained
    /// - Parameter places: places
    func didFinishObtainingPlaces(result: Result<ApiResponse, Error>)
    
    /// tells presenter that user is logged out now
    func didFinishLoggingOut()
}
