import UIKit

class AlertService {
    
    static let shared = AlertService()
    
    func showInfoAlert(on vc: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
