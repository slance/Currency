//
//  FavoriteTableDelegate.swift
//  Currency
//
//  Created by Lance Blue on 10/01/2017.
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

class FavoriteTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    var cellIdentifier = "favCellIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! FavoriteCell? ?? UINib(nibName: "FavoriteCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! FavoriteCell
        
        cell.currencyImageView.backgroundColor = UIColor.red
        cell.currencyCodeLabel.text = "CNY"
        cell.currencyValueLabel.text = "100"
        
        return cell
    }

}
