//
//  SearchRouter.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterInput {
    
    weak var view: UIViewController!
    
    /// alert appearance-related constants
    private class AlertAppearance {
        
        static let title = "Error occured"
        static let actionTitle = "OK"
    }

    func showErrorAlert(error: Error) {
        
        let alertController = UIAlertController(title: AlertAppearance.title, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: AlertAppearance.actionTitle, style: .default)
        
        alertController.addAction(action)
        
        view.present(alertController, animated: true)
    }
    
    func popSearchController() {
        view.navigationController?.popViewController(animated: true)
    }
}
