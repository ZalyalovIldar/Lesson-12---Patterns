import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if UserDefaultsManager.shared.isAllreadyRegistered() {
            window?.rootViewController = SearchWireFrame.createSearchModule()
        } else {
            window?.rootViewController = LoginWireFrame.createLoginModule()
        }
    }
}

