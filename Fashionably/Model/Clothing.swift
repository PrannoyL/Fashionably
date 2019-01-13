//
//  File.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-12.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import Foundation
class Clothing {
    var type : String = ""// Upper body, lower body, feet
    var warmthRating : Int = 0
    var category : String = "" // trousers, pullovers, coats , etc.
    var formalityRating : Int = 0
    init(type: String, warmthRating: Int, category: String, formalityRating: Int) {
        self.type = type
        self.warmthRating = warmthRating
        self.category = category
        self.formalityRating = formalityRating
    }
    
}
