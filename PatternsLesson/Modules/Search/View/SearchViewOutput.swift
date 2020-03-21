//
//  SearchViewOutput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    
    /// tells presenter that particular result was selected
    /// - Parameter cityName: name of the selected city
    func didSelectItem(with cityName: String)
    
    /// tells presenter to handle the error that occured in autocomplete controller
    /// - Parameter error: error that happened
    func handleError(error: Error)
    
    /// tells presenter that view needs initial setup
    func initialSetup()
    
    /// tells presenter that user pressed logout button
    func didPressLogoutButton()
}
