//
//  ViewController.swift
//  OmikuziApp
//
//  Created by 高橋康之 on 2020/09/15.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stickView: UIView!
    @IBOutlet var stickLabel: UILabel!
    @IBOutlet var stickHeight: NSLayoutConstraint!
    @IBOutlet var stickBottomMargin: NSLayoutConstraint!
    
    let resultTexts: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶"
    ]
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        if motion != UIEvent.EventSubtype.motionShake {
            // シェイクモーション以外では動作させない
            return
        }
        let resultNum = Int( arc4random_uniform(UInt32(resultTexts.count)) )
        stickLabel.text = resultTexts[resultNum]
        stickBottomMargin.constant = stickHeight.constant * -1

        UIView.animate(withDuration: 1, animations: {

            self.view.layoutIfNeeded()

            }, completion: { (finished: Bool) in
                // 後ほど記述します。
        })
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}

