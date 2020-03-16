//
//  InteractorOutput.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol InteractorOutput: AnyObject {
    
    func didFinishObtainingFormattedString(_ string: String)
}
