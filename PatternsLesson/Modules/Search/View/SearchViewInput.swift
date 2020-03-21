//
//  SearchViewInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol SearchViewInput: AnyObject {
    
    /// tells tableview to refresh its data
    func reloadData()
    /// assigns the given datasource to the tableview
    /// - Parameter dataSource: datasource to be assigned
    func connectDataSource(_ dataSource: SearchDataSource)
    /// remove all views and add results tableview
    func displayTableView()
    /// remove all views and add loading indicator
    func displayLoadingView()
    /// remove all views and add label with no results message
    func displayNoResultsMessage()
    /// remove all views and add label with initial message
    func displayInitialMessage()
    /// replace default back button with custom one
    func setupCustomBackButton()
    /// create and setup search controller
    func setUpSearchController()
}
