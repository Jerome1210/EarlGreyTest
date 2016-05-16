//
//  ViewController.swift
//  EarlGreyTest
//
//  Created by Lee on 2016/5/13.
//  Copyright © 2016年 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = createButton("test1")
        self.view.addSubview(button)
        let table = createTable()
        self.view.addSubview(table)
        
        var constraint = [NSLayoutConstraint]()
        let views = ["table" : table]
        constraint += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[table]-0-|",
                                                                     options: .AlignmentMask,
                                                                     metrics: nil,
                                                                     views:views)
        constraint += NSLayoutConstraint.constraintsWithVisualFormat("V:[table(300)]-0-|",
                                                                     options: .AlignmentMask,
                                                                     metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(constraint)
        
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
    
    func createTable() -> UITableView {
        let frame = CGRectMake(0, 0, 320, 300)
        let table = UITableView(frame: frame)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.accessibilityIdentifier = "table"
        return table
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "title \(indexPath.row)"
        cell.accessibilityIdentifier = cell.textLabel?.text
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

