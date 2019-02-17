//
//  ParseOperatingSystems.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import Foundation
class ParseOperatingSystems {
    class func parse(fileName: String) -> OperatingSystem? {
        var operatingSystem: OperatingSystem?
        
        if let jsonFileUrl = Bundle.main.url(forResource: fileName, withExtension: ".json") {
            if let jsonData = try? Data(contentsOf: jsonFileUrl) {
                do {
                    operatingSystem = try JSONDecoder().decode(OperatingSystem.self, from: jsonData)
                    return operatingSystem
                } catch let err {
                    print(err)
                }
            } else {
                print("Couldn't wrap data object")
            }
        } else {
            print("Failed identifier")
        }
        
        return nil
    }
}
