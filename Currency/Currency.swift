//
//  Currency.swift
//  Currency
//
//  Created by Lance Blue on 08/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import ObjectMapper

class Currency: BaseModel {
    
    var name: String?
    var code: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        name <- map["name"]
        code <- map["code"]
    }
    
    override var description: String {
        return "\(super.description), name:\(name), code:\(code)"
    }
    
}
