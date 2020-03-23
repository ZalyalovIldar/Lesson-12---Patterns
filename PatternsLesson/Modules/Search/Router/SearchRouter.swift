//
//  SearchSearchRouter.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

protocol SearchRouterInput: AnyObject {
    
    /// present alert with error
    /// - Parameter error: happend error
    func showAlertWith(error: Error)
    
    /// dismiss controller
    func dismissSearchController()
}

class SearchRouter: SearchRouterInput {
    
    weak var view: UIViewController!
    
    private let alertTitle = "Error"
    private let actionTitle = "Ok"
    
    func showAlertWith(error: Error) {
        
        print("Error:", error.localizedDescription)
        
        let alertController = UIAlertController(title: alertTitle, message: error.localizedDescription, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default))
        
        view.present(alertController, animated: true)
    }
    
    func dismissSearchController() {
        
        let loginController = LoginAssembly.configure()
        
        loginController.modalPresentationStyle = .fullScreen
        
        view.present(loginController, animated: false)
    }
}
