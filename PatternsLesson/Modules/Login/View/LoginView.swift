//
//  LoginView.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    /// view delegate
    weak var delegate: LoginViewDelegate?
    
    /// appearance-related constants
    private class Appearance {
        
        static let stackViewSpacing: CGFloat = 15
        
        static let stackViewLeftOffset = 32
        static let stackViewRightOffset = -32
        static let imageTopOffset = 50
        static let imageBottomOffset = -50
        
        static let buttonHeight = 50
        static let buttonCornerRadius: CGFloat = 10
        
        static let loginFieldHeight = 40
        static let passwordFieldHeight = 40
        static let imageHeight = 200
        static let imageWidth = 200
    
        
        static let logo = "googlemaps"
        
        static let loginPlaceholder = "Login"
        static let passwordPlaceholder = "Password"
        static let buttonTitle = "Login"
    }
    
    private lazy var stackView: UIStackView = {
        
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Appearance.stackViewSpacing
        
        return stack
    }()
    
    private lazy var loginField: UITextField = {
        
        var field = UITextField()
        field.placeholder = Appearance.loginPlaceholder
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        
        var field = UITextField()
        field.placeholder = Appearance.passwordPlaceholder
        field.isSecureTextEntry = true
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        
        var button = UIButton()
        button.backgroundColor = .orangeUi
        button.setTitle(Appearance.buttonTitle, for: .normal)
        button.layer.cornerRadius = Appearance.buttonCornerRadius
        
        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        
        var imageView = UIImageView()
        imageView.image = UIImage(named: Appearance.logo)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(logoImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(loginField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(loginButton)
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(self).offset(Appearance.imageTopOffset)
            make.bottom.equalTo(stackView.snp.top).offset(Appearance.imageBottomOffset)
            make.width.equalTo(logoImageView.snp.height)
            make.centerX.equalTo(self)
        
        }
        
        loginButton.snp.makeConstraints { make in
            
            make.height.equalTo(Appearance.buttonHeight)
            make.width.equalTo(stackView)
        }
        
        loginField.snp.makeConstraints { make in
            
            make.height.equalTo(Appearance.loginFieldHeight)
            make.width.equalTo(stackView)
        }
        
        passwordField.snp.makeConstraints { make in
            
            make.height.equalTo(Appearance.passwordFieldHeight)
            make.width.equalTo(stackView)
        }
        
        stackView.snp.makeConstraints { make in
            
            make.centerY.equalTo(self)
            
            make.left.equalTo(self).offset(Appearance.stackViewLeftOffset)
            make.right.equalTo(self).offset(Appearance.stackViewRightOffset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPressLoginButton() {
        delegate?.didPressLoginButton(dto: CredentialsDto(login: loginField.text, password: passwordField.text))
    }
    
    /// clears the values from auth fields
    func clearFields() {
        
        loginField.text = nil
        passwordField.text = nil
    }
}
