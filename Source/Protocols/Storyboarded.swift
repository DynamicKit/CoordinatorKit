//
//  Storyboarded.swift
//  CoordinatorKit
//
//  Created by Mohammad reza Koohkan on 4/24/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIViewController

public protocol Storyboarded {
    
    static var id: String { get }
    
    static func instantiate(in board: Storyboard) -> Self
        
    func push(fromNavigation navigation: UINavigationController, hideBottomBar: Bool, animated: Bool)

    func push(fromViewController vc: UIViewController, hideBottomBar: Bool, animated: Bool)
        
    func pop(animated: Bool)
    
    func modal(from viewController: UIViewController, animated: Bool)
    
    func present(from viewController: UIViewController, animated: Bool)
    
    
    
}

public extension Storyboarded where Self: UIViewController {
    

    static var id: String {
        return String(describing: self)
    }
    
    static func instantiate(in board: Storyboard) -> Self {
        return board.instantiate(Self.self) as! Self
    }
    
    func push(fromNavigation navigation: UINavigationController, hideBottomBar: Bool = true, animated: Bool = true) {
        navigation.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        navigation.pushViewController(self, animated: animated)
    }
    
    func push(fromViewController vc: UIViewController, hideBottomBar: Bool = true, animated: Bool = true) {
        guard let navigation = vc.navigationController else {
            CoordinatorError.vcNotEmbeddedInNavigation(vc).log()
            return
        }
        self.push(fromNavigation: navigation, hideBottomBar: hideBottomBar, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        guard let navigationViewController = self.navigationController else {
            CoordinatorError.vcNotEmbeddedInNavigation(self).log()
            return
        }
        navigationViewController.popViewController(animated: animated)
    }
    
    func modal(from viewController: UIViewController, animated: Bool = true) {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        self.present(from: viewController)
    }
    
    func present(from viewController: UIViewController, animated: Bool = true) {
        viewController.present(self, animated: animated)
    }
    
}

