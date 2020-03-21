//
//  PlacesService.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol PlacesService {
    
    /// makes request for places in the given city
    /// - Parameter city: city to search in
    /// - Parameter completion: completion that is called when data is received
    func getPlacesBy(city: String, completion: @escaping (Result<ApiResponse, Error>) -> Void)
}
