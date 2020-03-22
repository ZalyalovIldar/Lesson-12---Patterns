import UIKit

class SearchWireFrame: SearchWireFrameProtocol {
    
    static func createSearchModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchNavController = storyboard.instantiateViewController(identifier: "searchNavController") as! UINavigationController
        
        if let view = searchNavController.viewControllers.first as? SearchView {
            
            let presenter: SearchPresenterProtocol = SearchPresenter()
            let interactor: SearchInteractorProtocol = SearchInteractor()
            let wireFrame: SearchWireFrameProtocol = SearchWireFrame()
            
            return view
        }
        
        return UIViewController()
    }
    
    func presentPlaceDetailed() {
        //TODO:
    }
}
