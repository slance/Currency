//
//  YQLService.swift
//  Currency
//
//  Created by Lance Blue on 1/20/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class YQLService: BaseService {
    
    let yqlPrefix = "select * from"
    let yqlAddress = "https://query.yahooapis.com/v1/public/yql"
    let paramEnv = "http://datatables.org/alltables.env"
    
    func query<T: Mappable>(table: String, condition: String, completionHandler: @escaping (DataResponse<T>) -> Void) {
        let statement = "\(yqlPrefix) \(table) where \(condition)"
        Alamofire.request(yqlAddress,
                          method: .post,
                          parameters: ["q": statement,
                                       "format": "json",
                                       "env": paramEnv,
                                       "callback": ""])
            .responseObject(completionHandler: completionHandler)
    }
    
    func query<T: Mappable>(table: String, condition: String, completionHandler: @escaping (DataResponse<[T]>) -> Void) {
        let statement = "\(yqlPrefix) \(table) where \(condition)"
        Alamofire.request(yqlAddress,
                          method: .post,
                          parameters: ["q": statement,
                                       "format": "json",
                                       "env": paramEnv,
                                       "callback": ""])
            .validate(contentType: ["application/json"])
            .responseArray(keyPath: "result",
                           completionHandler: completionHandler)
    }

}
