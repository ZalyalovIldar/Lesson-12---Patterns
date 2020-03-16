//
//  ViewModel.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    
    var text: String { get set }
    
    var textDidChangedHandler: ((String) -> Void)? { get set }
    
    func obtainNumbers()
}

class ViewModel: ViewModelDelegate {
    
    var dataManager: DataManager!
    
    var text: String = "" {
        didSet {
            textDidChangedHandler?(text)
        }
    }
    
    var textDidChangedHandler: ((String) -> Void)?
    
    
    func obtainNumbers() {
        
        let numbers = dataManager.obtainNumbers()
               
        text = numbers.map({"\($0)"}).joined(separator: ",")
    }

}
