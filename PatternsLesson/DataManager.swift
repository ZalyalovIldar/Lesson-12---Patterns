//
//  DataManager.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol DataManager {
    
    func obtainNumbers() -> [Int]
}

class DataManagerImplementation: DataManager {
    
    func obtainNumbers() -> [Int] {
        return [1,2,3,4,5,6]
    }
}
