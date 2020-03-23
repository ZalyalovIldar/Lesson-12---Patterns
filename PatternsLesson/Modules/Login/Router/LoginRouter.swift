//
//  LoginLoginRouter.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 21/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterInput {
    
    weak var view: UIViewController!
    
    private let errorTitle = "Error"
    private let errorMessage = "Invalid login or password"
    private let dismissTitle = "Dismiss"
    
    func presentSearchController() {
        
        let searchVC = SearchAssembly.configure()
        let navVC = UINavigationController(rootViewController: searchVC)
        navVC.modalPresentationStyle = .fullScreen
        view.present(navVC, animated: true)
    }
    
    func showErrorAlert() {
        
        let alert  = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: dismissTitle, style: .cancel))
        view.present(alert, animated: true)
    }
}
