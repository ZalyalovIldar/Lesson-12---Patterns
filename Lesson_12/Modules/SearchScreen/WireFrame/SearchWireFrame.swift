import UIKit

class SearchWireFrame: SearchWireFrameProtocol {
    
    //MARK: - Instance Properties
    
    static func createSearchModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchNavController = storyboard.instantiateViewController(identifier: "searchNavController") as! UINavigationController
        
        if let view = searchNavController.viewControllers.first as? SearchView {
            
            var presenter: SearchPresenterProtocol = SearchPresenter()
            var interactor: SearchInteractorProtocol = SearchInteractor()
            let wireFrame: SearchWireFrameProtocol = SearchWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            
            return searchNavController
        }
        
        return UIViewController()
    }
}
