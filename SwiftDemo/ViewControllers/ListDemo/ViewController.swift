//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Capternal on 23/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var arrTitles = NSMutableArray(array: ["Swift", "Objective C", "Node JS", "ReactNative"])
    var arrImages = NSMutableArray(array: ["swift.png", "objectivec.png", "nodejs.png", "react-native.png"])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = AppConstants.ScreenTitles.DAILY_NEWS
        loadUI()
    }

    func loadUI() {
        tableView = UITableView (frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsetsMake(0, -15, 0, 0)
        tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitles.count > 0 ? arrTitles.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "customCell")
        cell.labelImage.image = UIImage(named: (arrImages.object(at: indexPath.row) as? String)!)
        cell.labelImage.contentMode = UIViewContentMode.scaleAspectFit
        cell.labelName.text = arrTitles.object(at: indexPath.row) as? String
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

