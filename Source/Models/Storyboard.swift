//
//  Storyboard.swift
//  CoordinatorKit
//
//  Created by Mohammad reza Koohkan on 4/24/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIStoryboard

public struct Storyboard {
    
    public let name: String
    
    public var storyBoard: UIStoryboard {
        return UIStoryboard(name: self.name, bundle: Bundle.main)
    }
    
    public func instantiate(id: String) -> UIViewController {
        return self.storyBoard.instantiateViewController(withIdentifier: id)
    }
    
    public func instantiate(_ storyBoardedClass: Storyboarded.Type) -> Storyboarded {
        return self.instantiate(id: storyBoardedClass.id) as! Storyboarded
    }
    
    public func instantiateInitial() -> UIViewController? {
        return self.storyBoard.instantiateInitialViewController()
    }
    
    public func instantiateInitialStoryboarded() -> Storyboarded? {
        return self.instantiateInitial() as? Storyboarded
    }
    
    
}
