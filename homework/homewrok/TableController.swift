//
//  TableController.swift
//  homewrok
//
//  Created by Kaihang An on 6/9/15.
//  Copyright (c) 2015 Thoughtworks. inc. All rights reserved.
//

import UIKit

class TableController: UITableViewController {
    var TableData:Array<Array<String>> = Array < Array<String> >()
//    var JsonDict:
    
    override func viewDidLoad() {
        get_json_data();
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    func get_json_data(){
        var error: NSError?
        if let path = NSBundle.mainBundle().pathForResource("facts", ofType: "json"){
            let jsonData:NSData = NSData(contentsOfFile: path)!
            let jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as! NSDictionary
        }
    }
}
