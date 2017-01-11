//
//  FavoriteTableDelegate.swift
//  Currency
//
//  Created by Lance Blue on 10/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
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
