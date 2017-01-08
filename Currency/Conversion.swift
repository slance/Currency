//
//  Conversion.swift
//  Currency
//
//  Created by Lance Blue on 08/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
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
        return "\(super.description), currencyF: \(currencyF), currencyF_Name: \(currencyF_Name), currencyT: \(currencyT), currencyT_Name: \(currencyT_Name), currencyFD: \(currencyFD), exchange: \(exchange), result: \(result), updateTime: \(updateTime)"
    }
    
}
