//
//  MVVMViewController.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: ViewModelDelegate? {
        didSet {
            viewModel?.textDidChangedHandler = { [weak self] text in
                self?.textLabel.text = text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionButtonDidPressed(_ sender: Any) {
        viewModel?.obtainNumbers()
    }
}
