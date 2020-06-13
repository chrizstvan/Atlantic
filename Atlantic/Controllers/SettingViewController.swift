//
//  SettingViewController.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

protocol SettingDelegate: class {
    func settingDone(vm: SettingsViewModel)
}

class SettingViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: SettingsCoordinator?
    private var settingVM = SettingsViewModel()
    weak var delegate: SettingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        self.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func closePageTappedButton(_ sender: Any) {
        coordinator?.didClosePage()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.settingDone(vm: settingVM)
        coordinator?.didClosePage()
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingVM.units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let settingItem = settingVM.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        
        if settingItem == settingVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingVM.selectedUnit = unit
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
}
