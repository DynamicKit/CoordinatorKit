//
//  Coordinator.swift
//  CoordinatorKit
//
//  Created by Mohammad reza Koohkan on 4/24/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UINavigationController

public protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    /// will asign vc to this property for dismissing
    ///
    /// Set initial value to empty var presentedViewControllers = []
    var presentedViewControllers: [UIViewController] { get set }
    
    var viewControllers: [UIViewController] { get }
    
    
    func start()
    
    func push(_ viewController: UIViewController & Storyboarded, hideTabbar: Bool, animated: Bool)
    func pop(animated: Bool)
    func pop(to vc: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
    
    func showModally(_ vc: UIViewController, animated: Bool)
    func show(_ vc: UIViewController, animated: Bool)
    func dismiss()
    
}

public extension Coordinator {
    
    var viewControllers: [UIViewController] {
        return self.navigationController.viewControllers
    }
    
    
    func push(_ viewController: UIViewController & Storyboarded, hideTabbar: Bool = true, animated: Bool = true) {
        viewController.push(fromNavigation: self.navigationController, hideBottomBar: hideTabbar, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        guard self.viewControllers.last != nil else {
            CoordinatorError.noViewControllerToPop(self.navigationController).log()
            return
        }
        self.navigationController.popViewController(animated: animated)
    }
    
    func pop(to vc: UIViewController, animated: Bool = true) {
        guard self.viewControllers.contains(vc) else {
            CoordinatorError.notContainsViewControllerToPop(vc, self.navigationController).log()
            return
        }
        self.navigationController.popToViewController(vc, animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        self.navigationController.popToRootViewController(animated: animated)
    }
    
    func showModally(_ vc: UIViewController, animated: Bool = true) {
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.show(vc, animated: animated)
    }

    func show(_ vc: UIViewController, animated: Bool = true) {
        self.presentedViewControllers.append(vc)
        self.navigationController.present(vc, animated: animated)
    }
    
    func dismiss() {
        var mostTopViewController = self.presentedViewControllers.last
        mostTopViewController?.dismiss(animated: true, completion: nil)
        self.presentedViewControllers.removeLast()
        mostTopViewController = nil
    }
    
}
