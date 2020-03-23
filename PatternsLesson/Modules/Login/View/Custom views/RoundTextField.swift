//
//  RoundTextField.swift
//  PatternsLesson
//
//  Created by Amir on 17.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class RoundTextField: UITextField {
    
    convenience init(isSecureText: Bool = false, placeholder: String, cornerRadius: CGFloat, backgroundColor: UIColor, textOffset: CGFloat = 0) {
        self.init()
                
        isSecureTextEntry = isSecureText
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        self.backgroundColor = backgroundColor
        
        textColor = .black
        
        if textOffset != 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: textOffset, height: self.frame.height))
            leftView = view
            leftViewMode = .always
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
}
