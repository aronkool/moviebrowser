//
//  MoviesListViewModel.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation

class MoviesListViewModel{
    
    private var result : MoviesResult?
    private (set) var loaderVisible = false
    private var lastSearch = SearchType.recent
    
    var resultsTitle : String{
        let searchType = result?.type ?? .recent
        switch searchType {
        case .query(let query): return "Results for: \(query)"
        default: return "Currently in theatres"
        }
    }
    
    var numberOfResults : Int{
        return result?.movies.count ?? 0
    }
    
    func searchDidStart(search : SearchType){
        lastSearch = search
        loaderVisible = true
    }
    
    func applyResults(result : MoviesResult){
        if lastSearch == result.type{
            loaderVisible = false
            self.result = result
        }
    }
    
    func movieAtIndexPath(indexPath : IndexPath) -> Movie?{
        return result?.movies[indexPath.row]
    }
}
