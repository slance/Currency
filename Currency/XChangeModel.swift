//
//  XChangeModel.swift
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

class XChangeModel: BaseModel {
    
    var rate: [XChangeRateModel]?
    
    override func mapping(map: Map) {
        rate = (try? map.value("rate")) ?? [Mapper<XChangeRateModel>().map(JSON: map.JSON["rate"] as! [String : Any])!]
    }
    
    override var description: String {
        return "\(super.description), rate:\(String(describing: self.rate))"
    }

}

class XChangeRateModel: BaseModel {

    var id: String = ""
    var name: String?
    var rate: Double = 0
    var date: Date?
    var ask: Double = 0
    var bid: Double = 0
    
    override func mapping(map: Map) {
        id <- map["id"]
        name <- map["Name"]
        rate <- (map["Rate"], TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } }))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let mappedDate: String = try! map.value("Date")
        var mappedTime: String = try! map.value("Time")
        mappedTime.insert(" ", at: mappedTime.index(mappedTime.endIndex, offsetBy: -2))
        date = dateFormatter.date(from: "\(mappedDate), \(mappedTime)")
        ask <- (map["Ask"], TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } }))
        bid <- (map["Bid"], TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } }))
    }
    
    override var description: String {
        return "\(super.description), id:\(self.id), name:\(String(describing: self.name)), rate:\(self.rate), date:\(String(describing: self.date)), ask:\(self.ask), bid:\(self.bid)"
    }

}
