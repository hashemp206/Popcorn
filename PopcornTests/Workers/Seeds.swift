//
//  Seeds.swift
//  PopcornTests
//
//  Created by Hashem Aboonajmi on 4/2/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation

struct Seeds
{
    struct Movies
    {
        static let batman = Movie(id: 1, title: "Batman begins", releaseDate: Date(), description: "Driven by tragedy, billionaire Bruce Wayne dedicated his life", poster_path: nil)
        
        static let superman = Movie(id: 2, title: "Superman", releaseDate: Date(timeIntervalSinceNow: 10*24*60*60), description: "Mid-mannered Clark Kent works as a reporter at the daily planet", poster_path: nil)
    }
    
    struct RecentSeaches {
        static let values = ["batman, superman"]
    }
}
