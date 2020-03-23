import Foundation

enum UserDefaultsKeys {
    
    static let isAuthorized = "isAuthorized"
}

class UserDefaultsManager {
    
    //MARK: - Instance Properties
    
    static let shared = UserDefaultsManager()
    
    //MARK: - Instance Methods
    
    func isAllreadyRegistered() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isAuthorized)
    }
    
    func saveUser(login: String, password: String) {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isAuthorized)
        print("Info: <\(true)> saved for key: \(UserDefaultsKeys.isAuthorized)")
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isAuthorized)
        print("Info: <\(false)> saved for key: \(UserDefaultsKeys.isAuthorized)")
    }
}
