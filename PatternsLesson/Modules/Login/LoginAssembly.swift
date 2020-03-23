//
//  LoginAssembly.swift
//  PatternsLesson
//
//  Created by Amir on 21.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class LoginAssembly {
    
    class func configure() -> UIViewController  {
        
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        view.output = presenter
        
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        
        return view
    }
}
