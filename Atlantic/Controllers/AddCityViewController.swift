//
//  AddCityViewController.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate: class {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController, Storyboarded {

    weak var coordinator: AddCityCoordinator?
    weak var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinish() // handle logic / pass param, ect
//    }
    
    @IBAction func saveCityName(_ sender: UIButton) {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=eeb837c7b6e47b8ab2cead52f9f216b2&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { (data)  in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] (result) in
                
                if let weatherVM = result {
                    
                    //self?.delegate?.addWeatherDidSave(vm: weatherVM)
                    //self?.coordinator?.didClosePage()
                    
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.coordinator?.didClosePage()
                    } else { print("hais")}
                }
            }
        }
    }
    
    @IBAction func closeViewTapped(_ sender: UIBarButtonItem) {
        coordinator?.didClosePage()
    }
    
    deinit {
        print("\(self) is deinit")
    }
}
