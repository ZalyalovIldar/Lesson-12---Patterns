import Foundation

fileprivate enum Constants {
    
    static let invalidCridentialsErrorMessage = "Invalid Cridentials"
}

class LoginPresenter: LoginPresenterProtocol {
    
    //MARK: - Instance Properties
    
    var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var wireFrame: LoginWireFrameProtocol!
    
    //MARK: - Instance Methods
    
    func viewDidLoad() {
        
    }
    
    func onLoginButtonPressed(login: String, password: String) {
        
        if interactor.isCorrectCridentials(login: login, password: password) {
            wireFrame.presentSearchScreen()
        } else {
            view.showError(errorMessage: Constants.invalidCridentialsErrorMessage)
        }
    }
}
