import UIKit
import GooglePlaces

class SearchView: UIViewController, SearchViewProtocol {
    
    //MARK: - Instance Properties
    
    var presenter: SearchPresenterProtocol!
    
    //MARK: -

    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    //MARK: - Instance Methods
    
    @IBAction func onLogoutButtonTouchUpInside(_ sender: Any) {
        presenter.onLogoutButtonTouchUpInside()
    }
    
    func displayErrorAlert(message: String) {
        AlertService.shared.showInfoAlert(on: self, title: "Error", message: message)
    }
    
    func displayInfoAlert(message: String) {
        AlertService.shared.showInfoAlert(on: self, title: "Info", message: message)
    }
    
    func setupView() {
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self

        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let subView = UIView(frame: CGRect(x: 0, y: 64.0, width: 350.0, height: 45.0))

        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false

        definesPresentationContext = true
    }
    
    //MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        presenter.viewDidLoad()
    }
}

//MARK: - GMSAutocompleteResultsViewControllerDelegate

extension SearchView: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        
        presenter.didSelected(place: place)
    }

    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error){
        
        self.displayErrorAlert(message: error.localizedDescription)
    }
}
