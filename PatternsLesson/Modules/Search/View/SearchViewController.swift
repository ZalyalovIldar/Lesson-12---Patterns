//
//  SearchSearchViewController.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 22/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import GooglePlaces

class SearchViewController: UIViewController, SearchViewInput {
    
    var output: SearchViewOutput!
    
    var searchController: UISearchController?
    var resultsController: GMSAutocompleteResultsViewController!
    var filter: GMSAutocompleteFilter!
        
    private let searchTableView = SearchTableView()
    
    private let logoutButtonTtitle = "Logout"
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view = searchTableView
        
        resultsController.delegate = self
        output.initialSetUP()
    }
    
    func initSearchController() {
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController?.searchResultsUpdater = resultsController
        
        definesPresentationContext = true
        navigationItem.titleView = searchController?.searchBar
        
        searchController?.hidesNavigationBarDuringPresentation = false
        
        filter.type = .city
        resultsController.autocompleteFilter = filter            
    }    
    
    // MARK: SearchViewInput
    func reloadTableView() {
        searchTableView.reloadData()
    }
    
    func connectData(source: SearchDataSource) {
        searchTableView.setData(source: source)
    }
    
    func initTableView() {
        searchTableView.initTable()
    }
    
    func initBackButton() {
        
         let button = UIBarButtonItem(title: logoutButtonTtitle, style: .plain, target: self, action: #selector(logoutButtonPressed))
        
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = button
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @objc func logoutButtonPressed() {
        output.logoutButtonPressed()
    }
}

//MARK: - Results Delegate
extension SearchViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        
        guard let cityName = place.name else { return }
        
        output.selectedCity(with: cityName)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        output.handle(error: error)
    }
}
