//
//  Router.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class Router: RouterInput {
    
    weak var view: UIViewController!
    
    func showOkAlert() {
        
        let alert = UIAlertController(title: "Hi", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        
        view.present(alert, animated: true, completion: nil)
    }
}
