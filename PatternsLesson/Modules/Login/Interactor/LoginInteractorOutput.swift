//
//  LoginInteractorOutput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: AnyObject {
    
    /// tells output that credentials are checked
    /// - Parameter success: was authentication successful or not
    func didCheckedCredentials(success: Bool)
    /// tells output if user is already authenticated
    /// - Parameter authenticated: boolean that indicates authorization
    func didCheckedAuth(authenticated: Bool)
}
