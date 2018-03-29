//
//  PopcornApi.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation

class PopcornApi {
    
    func search(withQuery query: String, page pageNumber: Int, completion: @escaping ([Movie]?, Error?) -> Void)
    {
        FNetworking.get(App.MovieRouter.search(query: query, page: pageNumber).path) { result in
            switch result {
            case .success(let response):
                
                do {
                    let movies = try [Movie].decode(from: response.data)
                    completion(movies, nil)
                    
                } catch {
                    completion(nil, error)
                }
                
            case .failure(let failure):
                completion(nil, failure.error)
            }
        }
    }
}
