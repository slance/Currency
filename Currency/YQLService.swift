//
//  YQLService.swift
//  Currency
//
//  Created by Lance Blue on 1/20/17.
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
