//
//  UIExtensions.swift
//  MovieDB
//
//  Created by Aron Kool on 09-09-18.
//  Copyright © 2018 aron. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    
    func register(cell: String){
        self.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
    }
}

extension UIImageView{
    
    func loadUrl(url : String?){
        isHidden = true
        if let url = url{
            let imageData = try? Data(contentsOf: URL(string: url)!)
            if let imageData = imageData{
                self.image = UIImage(data: imageData)
                isHidden = false
            }
        }
    }
}
