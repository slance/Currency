//
//  YQLModel.swift
//  Currency
//
//  Created by Lance Blue on 1/18/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import ObjectMapper

class YQLModel<T: Mappable>: BaseModel {
    
    var count: Int = 0
    var created: Date?
    var lang: String?
    var results: T?

    override func mapping(map: Map) {
        super.mapping(map: map)
        count <- map["query.count"]
        created <- (map["query.created"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss'Z'"))
        lang <- map["query.lang"]
        results <- map["query.results"]
    }
    
    override var description: String {
        return "\(super.description), count:\(self.count), created:\(self.created), lang:\(self.lang), results:\(self.results)"
    }

}
