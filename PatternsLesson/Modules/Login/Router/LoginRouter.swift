//
//  LoginRouter.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterInput {
    
    weak var view: UIViewController!
    
    /// alert appearance-related constants
    private class AlertAppearance {
        
        static let title = "Incorrect Credentials"
        static let message = "Make sure that you enter correct login and password"
        static let actionTitle = "OK"
    }
    
    func pushSearchViewController(animated: Bool) {
        view.navigationController?.pushViewController(SearchAssembly.configureModule(), animated: animated)
    }
    
    func showWrongCredentialsAlert() {
        
        let alertController = UIAlertController(title: AlertAppearance.title, message: AlertAppearance.message, preferredStyle: .alert)
        let action = UIAlertAction(title: AlertAppearance.actionTitle, style: .default)
        
        alertController.addAction(action)
        
        view.present(alertController, animated: true)
    }
}
