//
//  AuthView.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol AuthViewDelegate: AnyObject {
    func authButtonPressed(with user: User)
}

class AuthView: UIView {
    
    private let loginField = RoundTextField(placeholder: "Login", cornerRadius: 8, backgroundColor: .white, textOffset: 15)
    private let passwordField = RoundTextField(isSecureText: true, placeholder: "Password", cornerRadius: 8, backgroundColor: .white, textOffset: 15)
    
    private var button: UIButton!
    private var stack: UIStackView!
    
    private let loginButtonTitle = "Login"
    private let loginButtonCornerRadius: CGFloat = 10
    private let stackSpacing: CGFloat = 10
    private let stackHeight: CGFloat = 100
    private let loginButtonHeight: CGFloat = 50
    private let offset: CGFloat = 20
    
    weak var delegate: AuthViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        loginField.delegate = self
        passwordField.delegate = self
        
        initCoinstraints()
    }
    
    private func initViews() {
        
        initStack()
        initButton()
    }
    
    private func initStack() {
        
        stack = UIStackView(arrangedSubviews: [loginField, passwordField])
        stack.spacing = stackSpacing
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    private func initButton() {
        
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(loginButtonTitle, for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5565795866, blue: 0.3112466525, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = loginButtonCornerRadius
        button.clipsToBounds = true
        addSubview(button)
    }
    
    private func initCoinstraints() {
        
        initViews()
        
        NSLayoutConstraint.activate([
            
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: offset),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -offset),
            stack.heightAnchor.constraint(equalToConstant: stackHeight),
            
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: offset),
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: offset),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -offset),
            button.heightAnchor.constraint(equalToConstant: loginButtonHeight)
        ])
    }
    
    @objc private func loginButtonPressed() {
        
        guard let email = loginField.text, let password = passwordField.text else { return }
        
        delegate?.authButtonPressed(with: User(email: email.lowercased(), password: password))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearTextFields() {
        
        loginField.text = nil
        passwordField.text = nil
    }
    
}

extension AuthView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
