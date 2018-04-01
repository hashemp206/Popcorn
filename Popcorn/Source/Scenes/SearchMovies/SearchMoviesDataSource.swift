//
//  SearchMoviesDataSource.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 4/1/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import AsyncDisplayKit

class SearchMoviesDataSource: NSObject, ASCollectionDataSource {
    
    // set a type alias for DisplayMovie to reduce verbosity
    typealias Movie = SearchMovies.Search.ViewModel.DisplayMovie
    
    var displayedMovies = [Movie]()
    
    // at first there is no section. view only displays a search bar.
    var sections : [SearchMovies.Section] = [.movies, .activityIndicator]
    
    var isEmpty: Bool {
        return displayedMovies.isEmpty
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return sections.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return displayedMovies.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let row = indexPath.row
        let section = indexPath.section
        
        return { [weak self] in
            
            guard let `self` = self else {
                return ASCellNode()
            }
            
            if section == 0 {
                
                let movie = self.displayedMovies[row]
                return MovieNode(movie: movie)
                
            } else {
                return LoadingCell()
            }
        }
    }
    
    // MARK: Helper
    
    func hasSection(_ section: SearchMovies.Section) -> Bool
    {
        if let _ = sections.index(of: section)
        {
            return true
        } else {
            return false
        }
    }
    
    /// Delete a section
    ///
    /// - Parameter section: section to remove
    /// - Returns: returns deleted section index
    func deleteSection(_ section: SearchMovies.Section) -> Int?
    {
        if let sectionIndex = sections.index(of: section) {
            sections.remove(at: sectionIndex)
            
            return sectionIndex
        }
        return nil
    }
    
    func insertSection(_ section: SearchMovies.Section)
    {
        sections.append(section)
    }
    
    /// Insert new items in dataSource and return inserted items indexPaths
    ///
    /// - Parameter newItems: newItems to inset
    /// - Returns: indexPaths of inserted items
    func insertNewItems(_ newItems: [Movie]) -> [IndexPath]
    {
        // update data source
        displayedMovies.append(contentsOf: newItems)
        
        var indexPaths = [IndexPath]()
        let itemsCount = displayedMovies.count
        for row in itemsCount - newItems.count ..< itemsCount {
            let indexPath = IndexPath(row: row, section: 0)
            indexPaths.append(indexPath)
        }
        
        return indexPaths
    }
    
    /// delete all data
    func clear()
    {
        displayedMovies.removeAll()
    }
    
}
