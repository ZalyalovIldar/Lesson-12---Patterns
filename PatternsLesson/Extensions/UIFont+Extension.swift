//
//  UIFont+Extension.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// Method, that return Avenir font
    /// - Parameter size: size of returning font
    static func avenirMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }
}
