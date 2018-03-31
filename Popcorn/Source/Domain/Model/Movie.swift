//
//  Movie.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation


struct Movie: Decodable {
    
    let id: Int
    let title: String
    let releaseDate: Date?
    let description: String
    let poster_path: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title = "original_title", poster_path, releaseDate = "release_date", description = "overview"
    }
}


extension Movie {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        poster_path = try values.decode(String?.self, forKey: .poster_path)
        description = try values.decode(String.self, forKey: .description)
        
        let dateString = try values.decode(String.self, forKey: .releaseDate)
        // we use custom date formatter for decoding dates like yyyy-MM-dd
        let formatter = DateFormatter.yyyyMMdd
        releaseDate = formatter.date(from: dateString)
    }
}

extension Movie
{
    enum CodingError: Error { case decoding(String) }
}
