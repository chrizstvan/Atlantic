//
//  SettingsViewModel.swift
//  Atlantic
//
//  Created by Chris Stev on 13/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case farenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch (self) {
            case .celcius:
                return "Celcius"
            case .farenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    
    let units = Unit.allCases
    private var _selectedUnit = Unit.farenheit
    
    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
            
        } set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
