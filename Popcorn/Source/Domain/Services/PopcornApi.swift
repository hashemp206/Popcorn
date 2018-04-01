//
//  PopcornApi.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation

class PopcornApi {
    
    private var searchRequestID: String?
    func search(withQuery query: String, page pageNumber: Int, completion: @escaping ([Movie]?, Error?) -> Void)
    {
        // cancel previous search request
        cancelSearch()
        
        searchRequestID = FNetworking.get(App.MovieRouter.search(query: query, page: pageNumber).path) { result in
            switch result {
            case .success(let response):
                
                do {
                    let movies = try PagedMovies.decode(from: response.data).movies
                    completion(movies, nil)
                    
                } catch {
                    completion(nil, error)
                }
                
            case .failure(let failure):
                completion(nil, failure.error)
            }
        }
    }
    
    func cancelSearch()
    {
        // cancel previous request, this happens when previous search request has not completed, and user initiated a new search request
        if let searchRequestID = searchRequestID {
            FNetworking.cancel(searchRequestID)
        }
    }
}
