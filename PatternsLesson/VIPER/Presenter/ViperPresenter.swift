//
//  ViperPresenter.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class Presenter: ViperViewOutput, InteractorOutput {
    
    weak var view: ViperViewInput!
    var interactor: InteractorInput!
    var router: RouterInput!
    
    //MARK: - ViewOutput
    
    func didPressedAction() {
        interactor.obtainFormattedString()
    }
    
    //MARK: - Interactor Ouput
    
    func didFinishObtainingFormattedString(_ string: String) {
        
        view.showFormattedString(string)
        router.showOkAlert()
    }
}
