//
//  TestData.swift
//  MovieDBTests
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation
@testable import MovieDB

class TestData{
    
    static let createSome = TestData()
    
    var starMovies : [Movie]{
        var star = starWarsMovies
        star.append(Movie(title: "Star trek", movieDescription: "Startrek description", imageUrl: "https://example.org"))
        return star
    }
    
    var starWarsMovies : [Movie]{
        return [Movie(title: "Starwars episode 1", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 2", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 3", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 4", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 5", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 6", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "Starwars episode 7", movieDescription: "Bla", imageUrl: "https://example.org")]
    }
    
    var resentResults : [Movie]{
        return [Movie(title: "V for Vendetta", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "The Matrix", movieDescription: "Bla", imageUrl: "https://example.org"),
                Movie(title: "The dark knight", movieDescription: "Bla", imageUrl: "https://example.org")]
    }
}
