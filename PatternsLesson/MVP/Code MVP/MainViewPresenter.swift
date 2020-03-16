//
//  MainViewPresenter.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol PresenterOuput: AnyObject {
    
    func didPressedAction()
}

protocol PresenterInput: AnyObject {
    
    func showNumbers(_ numbers: [Int])
}

class MainViewPresenter: PresenterOuput {
    
    weak var view: PresenterInput!
    var dataManager: DataManager!
    
    func didPressedAction() {
        
        let numbers = dataManager.obtainNumbers()
        
        view.showNumbers(numbers)
    }
}
