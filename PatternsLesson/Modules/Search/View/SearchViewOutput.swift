//
//  SearchSearchViewOutput.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

protocol SearchViewOutput {

    /// notify presenter that result selected
    /// - Parameter name: name of city
    func selectedCity(with name: String)
    
    /// notify presenter to handle the error which occured in search controller
    /// - Parameter error: happened error
    func handle(error: Error)
    
    /// notify presenter to setup view
    func initialSetUP()
    
    /// notify presenter user pressed logout
    func logoutButtonPressed()
}
