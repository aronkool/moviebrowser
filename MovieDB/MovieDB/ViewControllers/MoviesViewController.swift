//
//  MoviesViewController.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import UIKit

class MoviesViewController : BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var resultsTitle: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    let viewModel = MoviesListViewModel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfResults
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath)
        return cell
    }
    
}
