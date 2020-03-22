import UIKit

fileprivate enum Constants {
    
    static let textFieldsViewCornerRadius = CGFloat(10)
}

class LoginView: UIViewController, LoginViewProtocol {
    
    //MARK: - Instance Properties
    
    var presenter: LoginPresenterProtocol!
    
    //MARK: -

    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    //MARK: - Instance Methods
    
    func setupView() {
        
        textFieldsView.layer.cornerRadius = Constants.textFieldsViewCornerRadius
        textFieldsView.clipsToBounds = true

        goButton.layer.cornerRadius = goButton.frame.height / 4
        
        //Hiding keyboard when tapped
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
        
        //Empty space at the textField beginning
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
    }
    
    func showError(errorMessage: String) {
        
        AlertService.shared.showInfoAlert(on: self, title: "Error", message: errorMessage)
    }
    
    @IBAction func onGoButtonTouchUpInside(_ sender: Any) {
        
        guard let login = loginTextField.text else { return }
        guard let password = loginTextField.text else { return }
        
        presenter.onLoginButtonPressed(login: login, password: password)
    }
    
    //MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

//MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
    }
}
