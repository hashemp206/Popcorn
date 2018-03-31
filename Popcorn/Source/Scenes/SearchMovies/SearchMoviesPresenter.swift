//
//  SearchMoviesPresenter.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright (c) 2018 Hashem Aboonajmi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
import Foundation

protocol SearchMoviesPresentationLogic
{
    func presentSearchedMovies(response: SearchMovies.Search.Response)
    func presentSearchFailure(response: SearchMovies.SearchFailure.Response)
    func presentSearchStarted()
}

class SearchMoviesPresenter: SearchMoviesPresentationLogic
{
    weak var viewController: SearchMoviesDisplayLogic?
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    func presentSearchStarted()
    {
        viewController?.displaySearchStarted()
    }
    
    func presentSearchedMovies(response: SearchMovies.Search.Response)
    {
        let displayedMovies = response.movies.map { movie -> SearchMovies.Search.ViewModel.DisplayMovie in
            
            var posterURL: URL?
            if let posterPath = movie.poster_path {
                posterURL = URL(string: App.posterBaseURL.absoluteString + posterPath)
            }
            return SearchMovies.Search.ViewModel.DisplayMovie(id: movie.id, title: movie.title, posterURL: posterURL, releaseDate: dateFormatter.string(from: movie.releaseDate), description: movie.description)
        }
        
        viewController?.displaySearchedMovies(viewModel: SearchMovies.Search.ViewModel(displayedMovies: displayedMovies))
    }
    
    func presentSearchFailure(response: SearchMovies.SearchFailure.Response)
    {
        let message = response.error.localizedDescription
        viewController?.displaySearchFailure(viewModel: SearchMovies.SearchFailure.ViewModel(message: message))
    }
}

