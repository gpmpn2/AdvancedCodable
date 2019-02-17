//
//  ParseClasses.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import Foundation
class ParseClasses {
    class func parse(fileName: String) -> [Class]? {
        var classes: [Class]
        
        if let jsonFileUrl = Bundle.main.url(forResource: fileName, withExtension: ".json") {
            if let jsonData = try? Data(contentsOf: jsonFileUrl) {
                do {
                    classes = try JSONDecoder().decode([Class].self, from: jsonData)
                    return classes
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
