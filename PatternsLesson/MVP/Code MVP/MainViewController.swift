//
//  MainViewController.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, PresenterInput, MainViewDelegate {

    var output: PresenterOuput!
    
    var mainView = MainView()
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.delegate = self
    }

    func showNumbers(_ numbers: [Int]) {
        
        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
        
        mainView.textLabel.text = numbersString
    }
    
    func actionDidPressed() {
        output.didPressedAction()
    }
}
