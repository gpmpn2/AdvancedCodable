//
//  OperatingSystemViewController.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import UIKit

class OperatingSystemViewController: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var operatingSystemLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    var operatingSystem: OperatingSystem?
    var formatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "OS Specs"
        formatter.dateFormat = "MM/dd/y"
        
        if let operatingSystem = operatingSystem {
            typeLabel.text = operatingSystem.type
            operatingSystemLabel.text = operatingSystem.operatingSystem
            versionLabel.text = "\(operatingSystem.version)"
            updatedLabel.text = formatter.string(from: operatingSystem.updated)
        }
        
        // Do any additional setup after loading the view.
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

extension OperatingSystemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OSReuse", for: indexPath)
        
        let row = indexPath.row
        
        guard let operatingSystem = operatingSystem else { return cell }
        
        if let cell = cell as? OperatingSystemsTableViewCell {
            switch row {
            case 0:
                cell.update(title: "Processor", head: operatingSystem.processor.hertz, middle: operatingSystem.processor.manufacturer, bottom: operatingSystem.processor.cores)
                break;
            case 1:
                cell.update(title: "Memory", head: operatingSystem.memory.size, middle: operatingSystem.memory.hertz, bottom: "\(operatingSystem.memory.DDR)")
                break;
            case 2:
                cell.update(title: "Startup Disk", head: operatingSystem.startupDisk.description, middle: "", bottom: "")
                break;
            case 3:
                cell.update(title: "Graphics", head: operatingSystem.graphics.manufacturer, middle: operatingSystem.graphics.type, bottom: operatingSystem.graphics.size)
                break;
            default:
                //error display
                break;
            }
        }
        
        return cell
    }
    
    
}
