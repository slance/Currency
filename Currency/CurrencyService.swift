//
//  CurrencyService.swift
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
import Alamofire
import AlamofireObjectMapper

class CurrencyService: NSObject {
    
    class func currencyList(success: @escaping ([Currency]) -> Void) {
        Alamofire.request("https://op.juhe.cn/onebox/exchange/list",
                          method: .post,
                          parameters: ["key": "30b8e8d8bd3ee4454a95abac2d4c7280"])
            .validate(contentType: ["application/json"])
            .responseArray(keyPath: "result.list",
                           completionHandler: { (response: DataResponse<[Currency]>) in
                            switch response.result {
                            case .success:
                                success(response.result.value!)
                            case .failure(let error):
                                print(error)
                            }
            })
    }
    
    class func rateConverter(from: String!, to: String!, success: @escaping ([Conversion]) -> Void) {
        Alamofire.request("https://op.juhe.cn/onebox/exchange/currency",
                          method: .post,
                          parameters: ["key": "30b8e8d8bd3ee4454a95abac2d4c7280",
                                       "from": from,
                                       "to": to])
            .validate(contentType: ["application/json"])
            .responseArray(keyPath: "result",
                           completionHandler: { (response: DataResponse<[Conversion]>) in
                            switch response.result {
                            case .success:
                                success(response.result.value!)
                            case .failure(let error):
                                print(error)
                            }
            })
    }

}
