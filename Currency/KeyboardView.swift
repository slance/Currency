//
//  KeyboardView.swift
//  Currency
//
//  Created by Lance Blue on 1/14/17.
//  Copyright © 2017 Lance Blue. All rights reserved.
//

import UIKit

class KeyboardView: UIView {

    var isShown = false
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func doneButtonItem_touch(_ sender: Any) {
        self.hide()
    }
    
    func show(_ container: UIView) {
        if !self.isShown {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 400)
            container.addSubview(self)
            self.isShown = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.height - self.bounds.height)
            })
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.height)
        }) { (finished) in
            self.isShown = false
            self.removeFromSuperview()
        }
    }

}
