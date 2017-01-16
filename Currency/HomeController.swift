//
//  HomeController.swift
//  Currency
//
//  Created by Lance Blue on 09/01/2017.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var timeSeriesView = UIView(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
    var favoriteView = UITableView(frame: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width, y: 0), size: UIScreen.main.bounds.size), style: .plain)
    
    let keyboardView = UINib(nibName: "KeyboardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! KeyboardView
    let favoriteDelegate = FavoriteTableDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.scrollView.addSubview(self.timeSeriesView)
        self.favoriteView.dataSource = favoriteDelegate
        self.favoriteView.delegate = favoriteDelegate
        self.favoriteView.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: favoriteDelegate.cellIdentifier)
        self.favoriteView.tableHeaderView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 0, height: 20)))
        self.favoriteView.tableFooterView = UIView()
        self.favoriteView.rowHeight = 81
        self.scrollView.addSubview(self.favoriteView)
        
        self.scrollView.contentSize.width = UIScreen.main.bounds.width * 2
        self.scrollView.contentOffset = CGPoint(x: UIScreen.main.bounds.width, y: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
