//
//  MVPViewController.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class MVPViewController: UIViewController, MVPViewInput {

    @IBOutlet weak var textLabel: UILabel!
    
    var output: MVPViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Input
    
    func showNumbers(_ numbers: [Int]) {
        
        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
        
        textLabel.text = numbersString
    }
    
    //MARK: - Actions
    
    @IBAction func didPressedAction(_ sender: Any) {
        output.didPressedAction()
    }
    
}

