//
//  UITableView.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Register cell in tableView
    /// - Parameter cell: cell for register
    func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
}

extension UITableViewCell {
    
    /// identifier of cell
    static var identifier: String {
        return String(describing: self)
    }
}
