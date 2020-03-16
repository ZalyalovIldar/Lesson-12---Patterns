//
//  MVPAssembly.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class MVPAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        guard let view = viewController as? MVPViewController else { return }
        
        let presenter = MVPPresenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
    }
}
