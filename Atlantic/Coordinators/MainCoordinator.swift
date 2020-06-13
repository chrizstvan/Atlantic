//
//  MainCoordinator.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        navigationController.delegate = self
        let vc = HomeTableViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func toAddCity() {
        let child = AddCityCoordinator(navigation: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func toSetting() {
        let child = SettingsCoordinator(navigation: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    //pop or backward
    func childDidFinish(_ child: Coordinator?) {
        
        for (index, coordinator) in childCoordinators.enumerated() {
            
            if coordinator === child as AnyObject {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    //delegate method from UINav controller
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let destinationViewController = fromViewController as? AddCityViewController {
            childDidFinish(destinationViewController.coordinator)
        }
    }
}
