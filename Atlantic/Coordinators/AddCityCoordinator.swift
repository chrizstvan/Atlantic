//
//  AddCityCoordinator.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class AddCityCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator? // weak because main coordinator udh pny child
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    var modalVC: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        modalVC = UINavigationController()
        let vc = AddCityViewController.instantiate()
        let subs = navigationController.viewControllers.first as? HomeTableViewController
        vc.delegate = subs
        vc.coordinator = self
        modalVC?.setViewControllers([vc], animated: false)
        
        if let modalScreen = modalVC {
            modalScreen.modalPresentationStyle = .fullScreen
            navigationController.present(modalScreen, animated: true, completion: nil)
        }
    }
    
    func didClosePage() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("this coordinator \(self) deinit")
    }
    
//    func didFinish() {
//        parentCoordinator?.childDidFinish(self)
//    }
}
