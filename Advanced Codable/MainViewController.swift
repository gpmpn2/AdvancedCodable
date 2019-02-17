//
//  ViewController.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func segueClassData(_ sender: Any) {
        self.performSegue(withIdentifier: "segueClasses", sender: self)
    }
    @IBAction func segueOperatingSystemSpecs(_ sender: Any) {
        self.performSegue(withIdentifier: "segueOperatingSystem", sender: self)
    }
    
    var classes: [Class]?
    var operatingSystem: OperatingSystem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classes = ParseClasses.parse(fileName: "classes")
        operatingSystem = ParseOperatingSystems.parse(fileName: "computer_specs")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ClassesTableViewController {
            destination.classes = classes
        } else if let destination = segue.destination as? OperatingSystemViewController {
            destination.operatingSystem = operatingSystem
        }
    }


}

