//
//  TestPassingDataViewController.swift
//  Atlantic
//
//  Created by Chris Stev on 05/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class TestPassingDataViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    @IBOutlet weak var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCItyTapped(_ sender: UIButton) {
        coordinator?.toAddCity()
    }
    
    @IBAction func settingTapped(_ sender: Any) {
        coordinator?.toSetting()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
