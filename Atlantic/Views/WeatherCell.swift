//
//  WeatherCell.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temepratureLabel: UILabel!
    
    var viewModel: WeatherViewModel? {
        didSet{
            guard let cityName = viewModel?.name else { return }
            guard let temperature = viewModel?.currentTemperature.temperature else { return }
            
            cityNameLabel.text = cityName
            temepratureLabel.text = "\(temperature.formatAsDegree)°"
        }
    }
}
