//
//  LoginViewController.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate, LoginViewInput {
    
    /// view output
    var presenter: LoginViewOutput!
    var loginView = LoginView()
    
    override func loadView() {
        
        loginView.delegate = self
        view = loginView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidLoad() {
        presenter.initialSetup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    //MARK: - LoginViewDelegate
    func didPressLoginButton(dto: CredentialsDto) {
        presenter.didPressLoginButton(dto: dto)
    }
    
    //MARK: - LoginViewInput
    func setHidesNavigationBar(_ hides: Bool) {
        navigationController?.isNavigationBarHidden = hides
    }
    
    func clearAuthFields() {
        loginView.clearFields()
    }
}
