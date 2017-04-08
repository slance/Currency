//
//  Conversion.swift
//  Currency
//
//  Created by Lance Blue on 08/01/2017.
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

class Conversion: BaseModel {

    var currencyF: String?
    var currencyF_Name: String?
    var currencyT: String?
    var currencyT_Name: String?
    var currencyFD: String?
    var exchange: Double?
    var result: Double?
    var updateTime: Date?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        currencyF <- map["currencyF"]
        currencyF_Name <- map["currencyF_Name"]
        currencyT <- map["currencyT"]
        currencyT_Name <- map["currencyT_Name"]
        currencyFD <- map["currencyFD"]
        exchange <- (map["exchange"], TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } }))
        result <- (map["result"], TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } }))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        updateTime <- (map["updateTime"], TransformOf<Date, String>(fromJSON: { dateFormatter.date(from: $0!) }, toJSON: { dateFormatter.string(from: $0!) }))
    }
    
    override var description: String {
        return "\(super.description), currencyF: \(String(describing: currencyF)), currencyF_Name: \(String(describing: currencyF_Name)), currencyT: \(String(describing: currencyT)), currencyT_Name: \(String(describing: currencyT_Name)), currencyFD: \(String(describing: currencyFD)), exchange: \(String(describing: exchange)), result: \(String(describing: result)), updateTime: \(String(describing: updateTime))"
    }
    
}
