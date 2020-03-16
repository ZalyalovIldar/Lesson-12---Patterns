//
//  VIPERAssembly.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class VIPERAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        guard let view = viewController as? ViperViewController else { return }
        
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        router.view = view
    }
}
