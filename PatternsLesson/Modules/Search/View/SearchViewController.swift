//
//  SearchViewController.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import GooglePlaces
import SnapKit

class SearchViewController: UIViewController, SearchViewInput, SearchViewDelegate, GMSAutocompleteResultsViewControllerDelegate {
    
    /// appearance-related constants
    private class Appearance {
        
        static let logoutButtonTitle = "Logout"
        static let noResultsMessage = "No results for a given city (perhaps it's too small)"
        static let initialMessage = "Select a city from the searchbar above"
    }
    
    /// google places results controller that provides autocompletion functionality
    var resultsViewController: GMSAutocompleteResultsViewController!
    var searchController: UISearchController?
    var searchView = SearchView()
    /// google places filter that is used to customize search results
    var filter: GMSAutocompleteFilter!
    
    /// view output
    var presenter: SearchViewOutput!
    
    lazy var logoutButton: UIBarButtonItem = {
        
        var button = UIBarButtonItem(title: Appearance.logoutButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(didPressLogoutButton))
        
        return button
    }()
        
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter.initialSetup()
        
        resultsViewController.delegate = self
    }
    
    func setUpSearchController() {
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        filter.type = .city
        resultsViewController.autocompleteFilter = filter
        
        searchController?.searchBar.sizeToFit()
        
        navigationItem.titleView = searchController?.searchBar
        
        definesPresentationContext = true

        searchController?.hidesNavigationBarDuringPresentation = false
    }
    
    //MARK: - Results Delegate
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        if let cityName = place.name {
            presenter.didSelectItem(with: cityName)
        }
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        presenter.handleError(error: error)
    }
    
    //MARK: - View Input
    func setupCustomBackButton() {
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = logoutButton
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func reloadData() {
        searchView.tableView.reloadData()
    }
    
    func connectDataSource(_ dataSource: SearchDataSource) {
        searchView.tableView.dataSource = dataSource
    }
    
    func displayTableView() {
        searchView.displayTableView()
    }
    
    func displayLoadingView() {
        searchView.displayLoadingView()
    }
    
    func displayNoResultsMessage() {
        searchView.displayMessage(Appearance.noResultsMessage)
    }
    
    func displayInitialMessage() {
        searchView.displayMessage(Appearance.initialMessage)
    }
    
    //MARK: - View Delegate
    @objc func didPressLogoutButton() {
        presenter.didPressLogoutButton()
    }
}
