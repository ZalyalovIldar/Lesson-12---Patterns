//
//  UIImageView+Extension.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Custom initializer for UILabel
    /// - Parameter cornerRadius: radius for rounded border
    convenience init(cornerRadius: CGFloat) {
        self.init()
        
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFit
    }
}
