//
//  UIView+Extension.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Method which enable constraints on view
    func enableConstraints() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
