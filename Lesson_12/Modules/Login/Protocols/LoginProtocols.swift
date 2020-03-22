import UIKit

protocol LoginWireFrameProtocol {
    
    static func createLoginModule() -> UIViewController
    
    //PRESENTER -> WIREFRAME
    func presentSearchScreen()
}

protocol LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol! { get set }
    
    //PRESENTER -> INTERACTOR
    func isCorrectCridentials(login: String, password: String) -> Bool
}

protocol LoginPresenterProtocol {
    
    var view: LoginViewProtocol! { get set }
    var interactor: LoginInteractorProtocol! { get set }
    var wireFrame: LoginWireFrameProtocol! { get set }
    
    //VIEW -> PRESENTER
    func viewDidLoad()
    func onLoginButtonPressed(login: String, password: String)
    
    //INTERACTOR -> PRESENTER
}

protocol LoginViewProtocol {
    
    var presenter: LoginPresenterProtocol! { get set }
    
    //PRESENTER -> VIEW
    func setupView()
    func showError(errorMessage: String)
}
