import UIKit
import GooglePlaces

class SearchView: UIViewController {

  var resultsViewController: GMSAutocompleteResultsViewController?
  var searchController: UISearchController?
  var resultView: UITextView?

  override func viewDidLoad() {
    super.viewDidLoad()

    resultsViewController = GMSAutocompleteResultsViewController()
    resultsViewController?.delegate = self

    searchController = UISearchController(searchResultsController: resultsViewController)
    searchController?.searchResultsUpdater = resultsViewController

    let navBarHeight = self.navigationController?.navigationBar.frame.height as! CGFloat
    let subView = UIView(frame: CGRect(x: 0, y: navBarHeight, width: 350.0, height: 45.0))

    subView.addSubview((searchController?.searchBar)!)
    view.addSubview(subView)
    searchController?.searchBar.sizeToFit()
    searchController?.hidesNavigationBarDuringPresentation = false
  }
}

extension SearchView: GMSAutocompleteResultsViewControllerDelegate {
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
    searchController?.isActive = false
    
    print("Place name: \(place.name ?? "Error")")
  }

  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didFailAutocompleteWithError error: Error){
    
    print("Error: ", error.localizedDescription)
  }
}
