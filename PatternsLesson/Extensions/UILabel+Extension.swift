//
//  UILabel+Extension.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// Custom initializer for UILabel
    /// - Parameters:
    ///   - fontSize: size for label text
    ///   - textColor: color for label text
    convenience init(fontSize: CGFloat = 15, textColor: UIColor) {
        self.init()
        
        self.font = .avenirMedium(size: fontSize)
        self.textColor = textColor
        numberOfLines = 0
        sizeToFit()
    }
    
}
