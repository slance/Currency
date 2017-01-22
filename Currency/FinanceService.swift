//
//  FinanceService.swift
//  Currency
//
//  Created by Lance Blue on 1/18/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit
import Alamofire

class FinanceService: YQLService {
    
    let xchangeTable = "yahoo.finance.xchange"
    
    func xchange(from: String, to: String, success: @escaping (YQLModel<XChangeModel>) -> Void) {
        self.query(table: xchangeTable, condition: "pair in (\"\(from)\(to)\")") { (response: DataResponse<YQLModel<XChangeModel>>) in
            switch response.result {
            case .success:
                success(response.result.value!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func xchange(from: String, to: [String], success: @escaping (YQLModel<XChangeModel>) -> Void) {
        var pair = ""
        for index in 0..<to.count {
            pair.append(",\"\(from)\(to[index])\"")
        }
        pair.characters.removeFirst()
        if to.count == 1 {
            self.xchange(from: from, to: to[0], success: success)
        } else {
            self.query(table: xchangeTable, condition: "pair in (\(pair))") { (response: DataResponse<YQLModel<XChangeModel>>) in
                switch response.result {
                case .success:
                    success(response.result.value!)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
