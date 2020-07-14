//
//  CoordinatorError.swift
//  CoordinatorKit
//
//  Created by Mohammad reza Koohkan on 4/24/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIViewController

enum CoordinatorError: CustomStringConvertible {
    
    case vcNotEmbeddedInNavigation(UIViewController)
    case noViewControllerToPop(UINavigationController)
    case notContainsViewControllerToPop(UIViewController,UINavigationController)

    var mark: String {
        return "@CoordinatorError: "
    }
    
    var description: String {
        switch self {
        case .vcNotEmbeddedInNavigation(let vc):
            return self.mark + "\(String(describing: vc)) has no navigationController"
        case .noViewControllerToPop(let nav):
            return self.mark + "There is no viewController in \(String(describing: nav)) to pop"
        case .notContainsViewControllerToPop(let vc, let nav):
            return self.mark + "\(String(describing: nav)) not contains \(String(describing: vc)), pop canceled"

        }
    }
    
    func log() {
        #if DEBUG
        debugPrint(self.description)
        #endif
    }
    
}
