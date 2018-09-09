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
}
