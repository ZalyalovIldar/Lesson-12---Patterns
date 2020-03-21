//
//  SearchViewDelegate.swift
//  PatternsLesson
//
//  Created by Enoxus on 20/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    
    /// tells delegate that logout button was pressed
    func didPressLogoutButton()
}
