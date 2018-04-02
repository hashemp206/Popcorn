//
//  SearchMoviesInteractorTests.swift
//  PopcornTests
//
//  Created by Hashem Aboonajmi on 4/2/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import UIKit
import XCTest
import PromiseKit

class SearchMoviesInteractorTests: XCTest {

    // MARK: - Subject under test
    
    var sut: SearchMoviesInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupSearchMoviesInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSearchMoviesInteractor()
    {
        sut = SearchMoviesInteractor()
    }
    
    // MARK: - Test doubles
    
    class SearchMoviesPresentationLogicSpy: SearchMoviesPresentationLogic
    {
        // MARK: Method call expectations
        
        var presentSearchMoviesCalled = false
        
        // MARK: Spied methods
        
        func presentSearchedMovies(response: SearchMovies.Search.Response)
        {
            presentSearchMoviesCalled = true
        }
        
        func presentSearchFailure(response: SearchMovies.SearchFailure.Response)
        {
            
        }
        
        func presentSearchStarted()
        {
            
        }
        func presentRecentSearches(response: SearchMovies.FetchRecentSearches.Response)
        {
            
        }
    }
    
    class SearchMoviesWorkerSpy: SearchMoviesWorker
    {
        // MARK: Method call expectations
        
        var searchMoviesCalled = false
        
        // MARK: Spied methods
        
        override func searchMovies(withSearchTerm searchTerm: String, page: Int) -> Promise<[Movie]> {
            searchMoviesCalled = true
            return Promise(value: [Seeds.Movies.batman, Seeds.Movies.superman])
        }
    }
    
    // MARK: - Tests
    
    func testSearchMoviesShouldAskSearchMoviesWorkerToSearchMoviesAndPresenterToFormatResult()
    {
        // Given
        let searchMoviesPresentationLogicSpy = SearchMoviesPresentationLogicSpy()
        sut.presenter = searchMoviesPresentationLogicSpy
        let searchMoviesWorkerSpy = SearchMoviesWorkerSpy(recentSearchesStore: RecentSearchesUserDefaultsStore())
        sut.worker = searchMoviesWorkerSpy
        
        // When
        let request = SearchMovies.Search.Request(searchTerm: "bat")
        sut.searchMovies(request: request)
        
        // Then
        XCTAssert(searchMoviesWorkerSpy.searchMoviesCalled, "SearchMovies() should ask SearchMoviesWorker to find movies")
        XCTAssert(searchMoviesPresentationLogicSpy.presentSearchMoviesCalled, "SearchMovies() should ask presenter to format movies result")
    }
}
