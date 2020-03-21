//
//  CredentialsDto.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

/// convenience entity to pass credentials around
struct CredentialsDto: Codable {
    
    let login: String?
    let password: String?
}
