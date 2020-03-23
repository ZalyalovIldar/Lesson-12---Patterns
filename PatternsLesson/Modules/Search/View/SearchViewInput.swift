//
//  SearchSearchViewInput.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//


protocol SearchViewInput: AnyObject {
    
    /// notify tableview to refresh its data
    func reloadTableView()
    
    /// set datasource to tableview
    /// - Parameter dataSource: datasource to be setted
    func connectData(source: SearchDataSource)
    
    /// initialize table view
    func initTableView()
    
    /// set custom back button
    func initBackButton()
    
    /// initialize search controller
    func initSearchController()   
}
