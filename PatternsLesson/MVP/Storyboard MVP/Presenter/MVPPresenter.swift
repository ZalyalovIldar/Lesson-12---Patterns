//
//  MVPPresenter.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class MVPPresenter: MVPViewOutput {
    
    weak var view: MVPViewInput!
    var dataManager: DataManager!
    
    func didPressedAction() {
        
        let numbers = dataManager.obtainNumbers()
        
        view.showNumbers(numbers)
    }
}
