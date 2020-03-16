//
//  CodeMVPAssembly.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class MainModuleAssembly {
    
    class func configuredModule() -> UIViewController {
        
        let view = MainViewController()
        
        let presenter = MainViewPresenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
        
        return view
    }
}
