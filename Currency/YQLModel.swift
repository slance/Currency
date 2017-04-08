//
//  YQLModel.swift
//  Currency
//
//  Created by Lance Blue on 1/18/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
        return "\(super.description), count:\(self.count), created:\(String(describing: self.created)), lang:\(String(describing: self.lang)), results:\(String(describing: self.results))"
    }

}
