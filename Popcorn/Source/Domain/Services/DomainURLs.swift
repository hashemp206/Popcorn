//
//  DomainURLs.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation

/// we define all the app domain urls in a same file, so we can change them later easily we use enum here, to add other domain cases easily, e.g we can define UserRouter that inlcude all url paths related to the user profile
enum App {
    static var baseURL: URL {
        return URL(string: "http://api.themoviedb.org/3/")!
    }
    static var posterBaseURL: URL {
        return URL(string: "http://image.tmdb.org/t/p/w92")!
    }
    
    static var domain: String {
        return Bundle.main.bundleIdentifier!
    }
    
    enum MovieRouter {
        // we need to include pagination object as parameter to all case
        case search(query: String, page: Int)
    }
}

protocol URLPath {
    var path: String { get }
}

extension App.MovieRouter: URLPath
{
    var path: String {
        
        switch self {
        case .search(let query, let page):
            return "search/movie?api_key=\(Constants.ApiKey)&query=\(query)&page=\(page)"
            
        }
    }
}
