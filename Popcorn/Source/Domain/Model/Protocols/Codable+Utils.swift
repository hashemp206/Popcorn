//
//  Serializable.swift
//  Fidilio
//
//  Created by Hashem Aboonajmi on 7/30/17.
//  Copyright © 2017 Fidilio. All rights reserved.
//

import Foundation

// two extension for encodable and decodable protocls that make easier data serial/deserialization

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}


