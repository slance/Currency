//
//  Currency.swift
//  Currency
//
//  Created by Lance Blue on 08/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Currency: BaseModel {
    
    var name: String?
    var code: String?
    

    class func list(success: @escaping (Array<Currency>) -> Void) {
        Alamofire.request("https://op.juhe.cn/onebox/exchange/list",
                          method: .post,
                          parameters: [ "key" : "30b8e8d8bd3ee4454a95abac2d4c7280"])
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["error_code"].int == 0 {
                    var array = Array<Currency>()
                    for data in json["result"]["list"].array! {
                        let currency = Currency()
                        currency.name = data["name"].string
                        currency.code = data["code"].string
                        array.append(currency)
                    }
                    success(array)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
