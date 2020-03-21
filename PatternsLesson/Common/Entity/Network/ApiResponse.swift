//
//  ApiResponse.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

/// api response struct that contains point-of-interest places in a particular town
struct ApiResponse: Codable {
    
    let results: [PlaceResult]
}
