//
//  MovieDetailsViewController.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation

/**
* This view is written programmaticly to meet the requirements
*/
class MovieDetailsViewController : BaseViewController{
    
    var movie : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        if let movie = movie{
            self.title = movie.title
        }
    }
}
