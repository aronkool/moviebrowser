//
//  MoviesViewModelTest.swift
//  MovieDBTests
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import XCTest
@testable import MovieDB

class MoviesViewModelTest: XCTestCase {
    
    private var recentResult : MoviesResult{
        return MoviesResult(type: .recent, movies: TestData.createSome.resentResults)
    }
    
    private var starwarsResult : MoviesResult{
        return MoviesResult(type: .query("Star wars"), movies: TestData.createSome.starWarsMovies)
    }
    
    private var starResult : MoviesResult{
        return MoviesResult(type: .query("Star"), movies: TestData.createSome.starMovies)
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRecent() {
        let model = MoviesListViewModel()
        assertBeginState(model: model)
        model.searchDidStart(search: .recent)
        assertLoaderVisiblity(visible: true, model: model)
        model.applyResults(result: recentResult)
        assertLoaderVisiblity(visible: false, model: model)
        assertViewState(title: "Currently in theatres", numberOfResults: 3, model: model)
    }
    
    func testMovieSearch() {
        let model = MoviesListViewModel()
        assertBeginState(model: model)
        model.searchDidStart(search: .query("Star wars"))
        assertLoaderVisiblity(visible: true, model: model)
        model.applyResults(result: starwarsResult)
        assertLoaderVisiblity(visible: false, model: model)
        assertStarWarsState(model: model)
    }
    
    func testConcurrentSearches(){
        let model = MoviesListViewModel()
        assertBeginState(model: model)
        model.searchDidStart(search: .recent)
        assertLoaderVisiblity(visible: true, model: model)
        model.searchDidStart(search: .query("Star"))
        model.searchDidStart(search: .query("Star wars"))
        assertLoaderVisiblity(visible: true, model: model)
        model.applyResults(result: recentResult)
        //There are results, but not from the last query, so don't update
        assertBeginState(ignoreLoader: true, model: model)
        model.applyResults(result: starwarsResult)
        assertStarWarsState(model: model)
        assertLoaderVisiblity(visible: false, model: model)
        //Ignore delayed results
        model.applyResults(result: starResult)
        assertStarWarsState(model: model)

    }
    
    private func assertLoaderVisiblity(visible : Bool, model : MoviesListViewModel){
        assert(model.loaderVisible == visible, "Unexpected visibility for loader")
    }
    
    private func assertBeginState(ignoreLoader : Bool = false, model : MoviesListViewModel){
        if !ignoreLoader{
            assertLoaderVisiblity(visible: false, model: model)
        }
        assertViewState(title: "Currently in theatres", numberOfResults: 0, model: model)
    }
    
    private func assertStarWarsState(model : MoviesListViewModel){
        assertViewState(title: "Results for: Star wars", numberOfResults: 7, model: model)
    }
    
    private func assertViewState(title : String, numberOfResults : Int, model : MoviesListViewModel){
        assert(model.numberOfResults == numberOfResults, "Unexpected number of results")
        assert(model.resultsTitle == title, "unexpected title")
    }
}
