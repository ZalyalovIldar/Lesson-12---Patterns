import Foundation
import GooglePlaces
import UIKit

class SearchPresenter: SearchPresenterProtocol {
    
    //MARK: - Instance Properties
    
    var view: SearchViewProtocol!
    var interactor: SearchInteractorProtocol!
    var wireFrame: SearchWireFrameProtocol!
    
    //MARK: - Instance Methods
    
    func viewDidLoad() {
        
    }
    
    func didSelected(place: GMSPlace) {
        
        let placeName = place.name
        let placePhoneNumber = place.phoneNumber
        let placeRating = place.rating
        
        let message = "Name: \(placeName ?? "") \nPhoneNumber: \(placePhoneNumber ?? "Unknown") \nRating: \(placeRating)"
        
        view.displayInfoAlert(message: message)
    }
    
    func onLogoutButtonTouchUpInside() {
        
        UserDefaultsManager.shared.logout()
        let loginView = LoginWireFrame.createLoginModule() as! LoginView
        UIApplication.setRootView(loginView)
    }
}
