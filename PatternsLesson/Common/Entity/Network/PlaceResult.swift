//
//  PlaceResult.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

/// struct that represents particular place received through api
struct PlaceResult: Codable {
    
    let name: String
    let rating: Double
    let photos: [Photo]?
}

/// additional struct for parse convenience
struct Photo: Codable {
    
    let photoReference: String
}
