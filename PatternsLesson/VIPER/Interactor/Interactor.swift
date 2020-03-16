//
//  Interactor.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class Interactor: InteractorInput {
    
    weak var output: InteractorOutput!
    
    var dataManager: DataManager!
    
    func obtainFormattedString() {
        
        let numbers = dataManager.obtainNumbers()
        
        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
        
        output.didFinishObtainingFormattedString(numbersString)
    }
}
