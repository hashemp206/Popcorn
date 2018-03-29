//
//  SearchMoviesRouter.swift
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

@objc protocol SearchMoviesRoutingLogic
{
    
}

protocol SearchMoviesDataPassing
{
    var dataStore: SearchMoviesDataStore? { get }
}

class SearchMoviesRouter: NSObject, SearchMoviesRoutingLogic, SearchMoviesDataPassing
{
    weak var viewController: SearchMoviesViewController?
    var dataStore: SearchMoviesDataStore?
    
    // MARK: Routing
    
    
    
    // MARK: Navigation
    
    
    // MARK: Passing data
    
    
}

