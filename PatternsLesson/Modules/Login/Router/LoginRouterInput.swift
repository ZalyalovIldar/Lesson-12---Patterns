//
//  LoginRouterInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginRouterInput: AnyObject {
    
    /// navigate to the search controller
    func pushSearchViewController(animated: Bool)
    /// display an alert if credentials are incorrect
    func showWrongCredentialsAlert()
}
