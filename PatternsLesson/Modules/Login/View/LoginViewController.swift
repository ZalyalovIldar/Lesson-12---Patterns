//
//  LoginLoginViewController.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 21/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    
    var output: LoginViewOutput!
    let authView = AuthView()
    let initialPosition = CGPoint(x: 0, y: 0)
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()                
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        view = authView
        
        authView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output.viewWillAppear()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        view.frame = CGRect(x: initialPosition.x, y: -keyboardSize.height / 2, width: view.frame.width, height: view.frame.height)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame = CGRect(x: initialPosition.x, y: initialPosition.y, width: view.frame.width, height: view.frame.height)
    }
    
    func clearTextFields() {
        authView.clearTextFields()
    }    
}

extension LoginViewController: AuthViewDelegate {
    
    func authButtonPressed(with user: User) {
        output.loginButtonPressed(with: user)
    }
}
