//
//  SearchDataSource.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

protocol SearchDataSource: AnyObject, UITableViewDataSource {
    
    /// array of formatted models 
    var places: [PlaceModel] { get set }
}
