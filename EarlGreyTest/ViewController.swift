//
//  ViewController.swift
//  EarlGreyTest
//
//  Created by Lee on 2016/5/13.
//  Copyright © 2016年 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = createButton("test1")
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButton(name: String) -> UIButton {
        let frame = CGRectMake(100, 100, 120, 120)
        let button = UIButton(type: UIButtonType.System)
        button.frame = frame
        button.accessibilityIdentifier = name
        button.accessibilityLabel = name
        button.setTitle(name, forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action:#selector(ViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    func buttonClicked(sender: UIButton) {
        if let id = sender.accessibilityIdentifier {
            print("did click \(id).")
            sender.backgroundColor = getRandomColor()
        }
    }
    
    func getRandomColor() -> UIColor {
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor.init(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}

