//
//  PageMovies.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/31/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation

struct PagedMovies: Decodable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
