//
//  XChangeModel.swift
//  Currency
//
//  Created by Lance Blue on 1/18/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import ObjectMapper

class XChangeModel: BaseModel {
    
    var rate: [XChangeRateModel]?
    
    override func mapping(map: Map) {
        rate = (try? map.value("rate")) ?? [Mapper<XChangeRateModel>().map(JSON: map.JSON["rate"] as! [String : Any])!]
    }
    
    override var description: String {
        return "\(super.description), rate:\(self.rate)"
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
        return "\(super.description), id:\(self.id), name:\(self.name), rate:\(self.rate), date:\(self.date), ask:\(self.ask), bid:\(self.bid)"
    }

}
