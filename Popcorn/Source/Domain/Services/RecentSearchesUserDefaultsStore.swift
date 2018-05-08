//
//  SuggestionsUserDefaultStore.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 4/1/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

protocol RecentSearchesStoreProtocol
{
    var capacityLimit: Int { get }
    func fetchRecentSearches(completionHandler: @escaping ([String]?, RecentSearchesStoreError?) -> Void)
    func insert(newSearchTerm term: String)
}

// MARK: - RecentSearch store operation errors

enum RecentSearchesStoreError: Error
{
    case CannotFetch(String)
}


/// Recent searches will persisted in UserDefaults
/// RecentSearchesUserDefaultsStore confroms to RecentSearchesStoreProtocol. if later we want to use CoreData, the CoreDataStorage class only needs to conform RecentSearchesStoreProtocol

class RecentSearchesUserDefaultsStore: RecentSearchesStoreProtocol {
    
    var capacityLimit: Int {
        return 10
    }
    
    func fetchRecentSearches(completionHandler: @escaping ([String]?, RecentSearchesStoreError?) -> Void)
    {
        let recentSearches = Defaults[.recentSearches]
        completionHandler(recentSearches, nil)
    }
    
    func insert(newSearchTerm term: String)
    {
        // if search term is not in recent searches
        if var recentSearches = Defaults[.recentSearches], !recentSearches.contains(term) {
            
            // new searchTerm will inserted at top
            recentSearches.insert(term, at: 0)
            
            // we only want to store 10 recent searches
            // prefix is bound safe. if capacityLimit is larger than array size, prefix returns the whole array
            Defaults[.recentSearches] = Array(recentSearches.prefix(capacityLimit))
        } else {
            
            Defaults[.recentSearches] = [term]
        }
    }
}
