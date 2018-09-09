//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import UIKit

/**
 * This view is written programmaticly to meet the requirements
 */
class MovieDetailsView : UIView{
    
    private struct Constants{
        static let margin : CGFloat = 8.0
        static let imageHeight : CGFloat = 360.0
    }
    
    var coverImage : UIImageView!
    var movieDescription : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createUIComponents()
    }
    
    private func createUIComponents(){
        createImageView()
        createMovieDescription()
    }
    
    private func createImageView(){
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        coverImage.layer.masksToBounds = true
        addSubview(coverImage)
        coverImage.pinAnchors([.leading,.top,.trailing], toItem: self).heightConstraint(height: Constants.imageHeight)
    }
    
    private func createMovieDescription(){
        movieDescription = UILabel()
        movieDescription.numberOfLines = 0
        movieDescription.textColor = .white
        addSubview(movieDescription)
        movieDescription.pinAnchors([.leading,.trailing], toItem: self).pinOppositeAnchor(.top, toItem: coverImage, contant: Constants.margin)
    }
}
