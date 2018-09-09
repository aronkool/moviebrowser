//
//  MoviesViewController.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import UIKit

class MoviesViewController : BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    private struct Segues{
        static let detailSeque = "showMovieDetails"
    }
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var resultsTitle: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    private let viewModel = MoviesListViewModel()
    private var selectedMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsCollectionView.register(cell: MovieCell.identifier)
        startSearching(search: .recent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? MovieDetailsViewController, let movie = selectedMovie{
            view.movie = movie
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfResults
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath)
        if let cell = cell as? MovieCell, let imageUrl = viewModel.movieAtIndexPath(indexPath: indexPath)?.imageUrl{
            cell.loadImage(url: imageUrl)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMovie = viewModel.movieAtIndexPath(indexPath: indexPath)
        performSegue(withIdentifier: Segues.detailSeque, sender: self)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            startSearching(search: .recent)
        } else{
            startSearching(search: .query(searchText))
        }
    }
    
    private func startSearching(search : SearchType){
        viewModel.searchDidStart(search: search)
        RestService().search(search: search).success { [weak self] (results) in
            DispatchQueue.main.async {
                self?.viewModel.applyResults(result: results)
                self?.updateUI()
            }
        }
        updateUI()
    }
    
    private func updateUI(){
        self.loader.isHidden = !viewModel.loaderVisible
        resultsTitle.text = viewModel.resultsTitle
        resultsCollectionView.reloadData()
    }
}
