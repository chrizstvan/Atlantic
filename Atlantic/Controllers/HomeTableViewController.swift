//
//  HomeTableViewController.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var viewModel = WeatherListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func addCityTapped(_ sender: UIBarButtonItem) {
        coordinator?.toAddCity()
    }
    
    @IBAction func settingTapped(_ sender: Any) {
        coordinator?.toSetting()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRow(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        let vm = viewModel.modelAt(indexPath.row)
        cell.viewModel = vm
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

extension HomeTableViewController: AddWeatherDelegate {
    
    //fech data
    func addWeatherDidSave(vm: WeatherViewModel) {
        viewModel.addWeatherViewModel(vm)
        tableView.reloadData()
    }
}

extension HomeTableViewController: SettingDelegate {
    func settingDone(vm: SettingsViewModel) {
        viewModel.updateUnit(to: vm.selectedUnit)
        tableView.reloadData()
    }
}
