//
//  PlaceResponse.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

/// struct to decode place
struct PlaceResponse: Codable {
    
    let name: String
    let photos: [Photo]?
}

/// helper struct
struct Photo: Codable {
    let reference: String
}

struct Response: Codable {
    let places: [PlaceResponse]
}

