//
//  ViperViewController.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViperViewController: UIViewController, ViperViewInput {

    var output: ViperViewOutput!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Input
    
    func showFormattedString(_ string: String) {
        textLabel.text = string
    }
    
    //MARK: - Actions
    
    @IBAction func didPressedAction(_ sender: Any) {
        output.didPressedAction()
    }

}
