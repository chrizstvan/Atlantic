//
//  SettingsCoordinator.swift
//  Atlantic
//
//  Created by Chris Stev on 13/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator? // weak because main coordinator udh pny child
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var modalVC: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        modalVC = UINavigationController()
        let vc = SettingViewController.instantiate()
        vc.coordinator = self
        let subs = navigationController.viewControllers.first as? HomeTableViewController
        vc.delegate = subs
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
}
