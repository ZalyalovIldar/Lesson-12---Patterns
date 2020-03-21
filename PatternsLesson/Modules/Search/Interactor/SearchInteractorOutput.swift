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
    func didFinishObtainingPlaces(places: [PlaceResult])
    /// tells presenter that request is finished with error
    /// - Parameter error: error itself
    func finishedObtainingWithError(error: Error)
    /// tells presenter that user is logged out now
    func didFinishLoggingOut()
}
