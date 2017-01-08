//
//  CurrencyService.swift
//  Currency
//
//  Created by Lance Blue on 08/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class CurrencyService: NSObject {
    
    class func currencyList(success: @escaping ([Currency]) -> Void) {
        Alamofire.request("https://op.juhe.cn/onebox/exchange/list",
                          method: .post,
                          parameters: [ "key" : "30b8e8d8bd3ee4454a95abac2d4c7280"])
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

}
