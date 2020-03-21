//
//  LoginAssembly.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class LoginAssembly {
    
    /// injects dependencies and returns viewcontroller
    class func configureModule() -> UIViewController {
        
        let view = LoginViewController()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let loginService = LoginServiceImpl()
        let authService = AuthServiceImpl()
        
        view.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.loginService = loginService
        interactor.presenter = presenter
        interactor.authService = authService
        
        router.view = view
        
        loginService.userDefaults = UserDefaults.standard
        authService.userDefaults = UserDefaults.standard
        
        return view
    }
}
