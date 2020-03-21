//
//  Endpoints.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class Endpoints {
    
    /// google api url to retrieve point-of-interest places from a given city using textsearch
    /// - Parameter city: city where places should be located
    static func pointOfInterstUrl(city: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(city)+point+of+interest&sensor=false&key=\(Constants.apiKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? String()
    }
    
    /// google api url to retrieve downscaled image of place by photo reference
    /// - Parameter reference: photo reference
    static func imageUrl(reference: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=\(reference)&key=\(Constants.apiKey)"
    }
}
