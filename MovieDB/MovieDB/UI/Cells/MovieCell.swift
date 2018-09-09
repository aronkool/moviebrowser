//
//  MovieCell.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import UIKit

class MovieCell : UICollectionViewCell{
    static let identifier = "MovieCell"
    
    @IBOutlet weak var movieCover: UIImageView!
    
    func loadImage(url : String){
        movieCover.loadUrl(url: TheMovieDB.imagesUrl + url)
    }
}
