//
//  MVVMAssembly.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class MVVMAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        guard let view = viewController as? MVVMViewController else { return }
        
        let viewModel = ViewModel()
        let dataManager = DataManagerImplementation()
        
        view.viewModel = viewModel
        
        viewModel.dataManager = dataManager
    }
}
