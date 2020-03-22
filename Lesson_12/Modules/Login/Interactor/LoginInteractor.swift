import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    //MARK: - Instance Properties
    
    var presenter: LoginPresenterProtocol!
    
    //MARK: - Instance Merhods
    
    func isCorrectCridentials(login: String, password: String) -> Bool {
        
        return (login == "login" && password == "password")
    }
}
