//
//  SearchType.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation

enum SearchType : Equatable{
    
    case recent
    case query(String)
    
    var url : URL{
        var components = URLComponents(string: TheMovieDB.baseUrl)!
        var params = [URLQueryItem(name: "api_key", value: TheMovieDB.apiKey)]
        switch self {
        case .recent: components.path = "/3/movie/now_playing"
        case .query(let query):
            components.path = "/3/search/movie"
            params.append(URLQueryItem(name: "query", value: query))
        }
        components.queryItems = params
        return components.url!
    }
}
