import UIKit
import GooglePlaces

protocol SearchWireFrameProtocol {
    
    static func createSearchModule() -> UIViewController
}

protocol SearchInteractorProtocol {
    
    var presenter: SearchPresenterProtocol! { get set }
}

protocol SearchPresenterProtocol {
    
    var view: SearchViewProtocol! { get set }
    var interactor: SearchInteractorProtocol! { get set }
    var wireFrame: SearchWireFrameProtocol! { get set }
    
    //VIEW -> PRESENTER
    func viewDidLoad()
    func didSelected(place: GMSPlace)
    func onLogoutButtonTouchUpInside()
}

protocol SearchViewProtocol {
    
    var presenter: SearchPresenterProtocol! { get set }
    
    //PRESENTER -> VIEW
    func displayErrorAlert(message: String)
    func displayInfoAlert(message: String)
}
