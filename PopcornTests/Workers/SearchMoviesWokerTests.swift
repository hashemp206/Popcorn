//
//  SearchMoviesWokerTests.swift
//  PopcornTests
//
//  Created by Hashem Aboonajmi on 4/2/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import UIKit
import XCTest
import PromiseKit
import Async

class SearchMoviesWokerTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: SearchMoviesWorkerSpy!
    static var testMovies: [Movie]!
    static var testRecentSearches: [String]!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupSearchMoviesWorker()
    }
    
    func setupSearchMoviesWorker()
    {
        sut = SearchMoviesWorkerSpy(recentSearchesStore: RecentSearchesUserDefaultsStore())
        
        SearchMoviesWokerTests.testMovies = [Seeds.Movies.batman, Seeds.Movies.superman]
        SearchMoviesWokerTests.testRecentSearches = Seeds.RecentSeaches.values
    }
    
    // MARK: - Test doubles
    
    class SearchMoviesWorkerSpy: SearchMoviesWorker
    {
        // MARK: Method call expectations
        
        var searchMoviesWasCalled = false
        var fetchRecntSearchesWasCalled = false
        
        override func searchMovies(withSearchTerm searchTerm: String, page: Int) -> Promise<[Movie]> {
            searchMoviesWasCalled = true
            
            return Promise(value: SearchMoviesWokerTests.testMovies)
        }
        
        override func fetchRecentSearches() -> Promise<[String]> {
            fetchRecntSearchesWasCalled = true
            return Promise(value: SearchMoviesWokerTests.testRecentSearches)
        }
    }
    
    // MARK: - Tests
    
    func testSearchMoviesShouldReturnListOfMovies()
    {
        // Given
        let searchMoviesSpy = sut
        
        // When
        var foundMovies = [Movie]()
        let expect = expectation(description: "Wait for searchMovies to return")
        searchMoviesSpy?.searchMovies(withSearchTerm: "bat", page: 1).then { movies -> Void in
            foundMovies = movies
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(searchMoviesSpy!.searchMoviesWasCalled, "Calling searchMovies() should ask the popCorn api to return a list of movies")
        XCTAssertEqual(foundMovies.count, SearchMoviesWokerTests.testMovies.count, "searchMovies() should return a list of movies")
    }
    
    func testSearchMoviesShouldReturnListOfRecentSearches()
    {
        // Given
        let searchMoviesSpy = sut
        
        // When
        var recentSearches = [String]()
        let expect = expectation(description: "Wait for searchMovies to return")
        searchMoviesSpy?.fetchRecentSearches().then { values -> Void in
            recentSearches = values
            expect.fulfill()
            
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(searchMoviesSpy!.fetchRecntSearchesWasCalled, "Calling fetchRecentSearches() should return a list of recent searches")
        XCTAssertEqual(recentSearches.count, SearchMoviesWokerTests.testRecentSearches.count, "recentSearches() should return a list of recent searches")
        
        for value in recentSearches {
            XCTAssert(SearchMoviesWokerTests.testRecentSearches.contains(value), "Fetched recent searches should match persisted searches")
        }
    }
}
