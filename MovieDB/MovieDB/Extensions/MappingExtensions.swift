//
//  MappingExtensions.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation

extension MoviesResult{
    
    static func map(type : SearchType, data : Data) -> MoviesResult{
        var movieList = [Movie]()
        if let map = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any>{
            if let results = map?.subList("results"){
                for result in results{
                    movieList.append(mapResult(mapping: result))
                }
            }
        }
        return MoviesResult(type: type, movies: movieList)
    }
    
    private static func mapResult(mapping : Dictionary<String, Any>) -> Movie{
        return Movie(title: mapping.string("title"), movieDescription: mapping.string("overview"), imageUrl: mapping.string("poster_path"))
    }
}

fileprivate extension Dictionary where Key == String, Value == Any{
    
    func string(_ key : String) -> String{
        return self[key] as? String ?? ""
    }
    
    func subList(_ key : String) -> [Dictionary<String, Any>]{
        return self[key] as? [Dictionary<String, Any>] ?? []
    }
}
