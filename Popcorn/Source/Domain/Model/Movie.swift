//
//  Movie.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation


struct Movie: Codable {
    
    let id: Int
    let title: String
    let posterURL: URL?
    let releaseDate: Date
    let description: String
    
    // poster_path is not usable, using this private property to construct posterURL
    private let poster_path: String
    
    enum CodingKeys: String, CodingKey {
        case id, title = "original_title", poster_path, releaseDate = "release_date", description = "overview"
    }
}


extension Movie {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        poster_path = try values.decode(String.self, forKey: .poster_path)
        posterURL = URL(string: App.baseURL.absoluteString + poster_path)
        releaseDate = try values.decode(Date.self, forKey: .releaseDate)
        description = try values.decode(String.self, forKey: .description)
    }
}

extension Movie
{
    enum CodingError: Error { case decoding(String) }
}
