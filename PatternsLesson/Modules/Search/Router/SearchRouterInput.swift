//
//  SearchRouterInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchRouterInput: AnyObject {
    
    /// show alert with error
    /// - Parameter error: error itself
    func showErrorAlert(error: Error)
    /// pops controller 
    func popSearchController()
}
