//
//  Classes.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import Foundation
struct Class {
    var title: String
    var startDate: Date
    var finalDate: Date
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case startDate = "start_date"
        case finalDate = "final_date"
        case description
    }
}

extension Class: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(finalDate, forKey: .finalDate)
        try container.encode(description, forKey: .description)
    }
}

extension Class: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        
        let startDateString = try values.decode(String.self, forKey: .startDate)
        let finalDateString = try values.decode(String.self, forKey: .finalDate)
        
        let formatter = DateFormatter.yyyyMMdd
        if let updatedStartdate = formatter.date(from: startDateString), let updatedFinalDate = formatter.date(from: finalDateString) {
            startDate = updatedStartdate
            finalDate = updatedFinalDate
        } else {
            //not sure how to list 2 keys here
            throw DecodingError.dataCorruptedError(forKey: .startDate,
                                                   in: values,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }
    }
}
