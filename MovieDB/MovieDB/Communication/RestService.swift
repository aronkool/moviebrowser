//
//  RestService.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation

struct TheMovieDB{
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imagesUrl = "https://image.tmdb.org/t/p/w200"
    //I rather not have my API-key in a (public) repo
    static let apiKey = "c1ec8bceb177a2b79d49d6b340269743"
}

class RestService{
    
    func search(search : SearchType) -> RestPromise<MoviesResult>{
        let promise = RestPromise<MoviesResult>()
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: search.url) { (data, response, error) in
            if let error = error {
                promise.error = error
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let movieResult = MoviesResult.map(type: search, data: data)
                promise.result = movieResult
            } else{
                print("Something went wrong, we don't know what")
            }
        }
        dataTask.resume()
        return promise
    }
}

class RestPromise<T>{
    
    fileprivate var result : T?{
        didSet{
            if let result = result{
                successCallbacks.forEach({ $0(result) })
                clearCallbacks()
            }
        }
    }
    fileprivate var error : Error?{
        didSet{
            if let error = error{
                errorCallbacks.forEach({ $0(error) })
                clearCallbacks()
            }
        }
    }
    private var successCallbacks = [(T) -> Void]()
    private var errorCallbacks = [(Error) -> Void]()
    
    @discardableResult
    func success(_ callback : @escaping (T) -> Void) -> RestPromise<T>{
        if let result = result{
            callback(result)
        } else{
            successCallbacks.append(callback)
        }
        return self
    }
    
    @discardableResult
    func failure(_ callback : @escaping (Error) -> Void) -> RestPromise<T>{
        //Not really using this, because I focussed on other parts of the app instead of errorhandling
        if let error = error{
            callback(error)
        } else{
            errorCallbacks.append(callback)
        }
        return self
    }
    
    private func clearCallbacks(){
        successCallbacks = []
        errorCallbacks = []
    }
}
