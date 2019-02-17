//
//  OperatingSystem.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import Foundation
struct OperatingSystem {
    var operatingSystem: String
    var version: Double
    var updated: Date
    var type: String
    var processor: Processor
    var memory: Memory
    var startupDisk: StartupDisk
    var graphics: Graphics
    
    enum CodingKeys: String, CodingKey {
        case operatingSystem = "OS"
        case version
        case updated
        case type
        case processor
        case memory
        case startupDisk = "startup_disk"
        case graphics
    }
}

struct Processor: Codable {
    var hertz: String
    var manufacturer: String
    var cores: String
}

struct Memory: Codable {
    var size: String
    var hertz: String
    var DDR: Int
}

struct StartupDisk: Codable {
    var description: String
}

struct Graphics: Codable {
    var manufacturer: String
    var type: String
    var size: String
}

extension OperatingSystem: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(operatingSystem, forKey: .operatingSystem)
        try container.encode(version, forKey: .version)
        try container.encode(type, forKey: .type)
        try container.encode(processor, forKey: .processor)
        try container.encode(memory, forKey: .memory)
        try container.encode(startupDisk, forKey: .startupDisk)
        try container.encode(graphics, forKey: .graphics)
    }
}

extension OperatingSystem: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        operatingSystem = try values.decode(String.self, forKey: .operatingSystem)
        version = try values.decode(Double.self, forKey: .version)
        type = try values.decode(String.self, forKey: .type)
        processor = try values.decode(Processor.self, forKey: .processor)
        memory = try values.decode(Memory.self, forKey: .memory)
        startupDisk = try values.decode(StartupDisk.self, forKey: .startupDisk)
        graphics = try values.decode(Graphics.self, forKey: .graphics)
        let updatedString = try values.decode(String.self, forKey: .updated)
        
        let formatter = DateFormatter.iso8601Full
        if let date = formatter.date(from: updatedString) {
            updated = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .updated,
                                                   in: values,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }
    }
}

