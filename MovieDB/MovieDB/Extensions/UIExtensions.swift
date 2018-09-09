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



extension UIView{
    
    enum AnchorPoint{
        case top
        case bottom
        case leading
        case trailing
    }
    
    @discardableResult
    func pinAnchors(_ anchors: [AnchorPoint], toItem: UIView) -> UIView{
        self.translatesAutoresizingMaskIntoConstraints = false
        let margins = toItem.layoutMarginsGuide
        for anchor in anchors{
            switch anchor{
            case .top: self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
            case .bottom: self.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
            case .leading: self.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            case .trailing: self.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            }
        }
        return self
    }
    
    @discardableResult
    func pinOppositeAnchor(_ anchor: AnchorPoint, toItem: UIView, contant: CGFloat) -> UIView{
        self.translatesAutoresizingMaskIntoConstraints = false
        let margins = toItem.layoutMarginsGuide
        switch anchor{
        case .top: self.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: contant).isActive = true
        case .bottom: self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: contant).isActive = true
        case .leading: self.leadingAnchor.constraint(equalTo: margins.trailingAnchor, constant: contant).isActive = true
        case .trailing: self.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: contant).isActive = true
        }
        return self
    }
    
    @discardableResult
    func heightConstraint(height : CGFloat) -> UIView{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
}
