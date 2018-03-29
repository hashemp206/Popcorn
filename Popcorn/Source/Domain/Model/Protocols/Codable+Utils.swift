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
    func encode(with encoder: JSONEncoder = Self.jsonEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
    
    // defining a date encoding startegy for json encoder
    static func jsonEncoder() -> JSONEncoder {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        return jsonEncoder
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = Self.jsonDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }

    // defining a date encoding startegy for json decoder
    static func jsonDecoder() -> JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }
}


