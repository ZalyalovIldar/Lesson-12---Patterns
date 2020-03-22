import UIKit

fileprivate enum Constants {
    
    static let mainStoryboard = "Main"
    static let loginViewController = "loginViewController"
}

class LoginWireFrame: LoginWireFrameProtocol {
    
    //MARK: - Instance Methods
    
    static func createLoginModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
        if let view = storyboard.instantiateViewController(identifier: Constants.loginViewController) as? LoginView {
            
            var presenter: LoginPresenterProtocol = LoginPresenter()
            var interactor: LoginInteractorProtocol = LoginInteractor()
            let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            
            return view
        }
        
        return UIViewController()
    }
    
    func presentSearchScreen() {
        
        let searchScreen = SearchWireFrame.createSearchModule()
        UIApplication.setRootView(searchScreen)
    }
}
