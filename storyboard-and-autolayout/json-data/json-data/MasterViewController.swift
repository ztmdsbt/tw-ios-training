//
//  MasterViewController.swift
//  json-data
//
//  Created by Kaihang An on 6/23/15.
//  Copyright (c) 2015 Thoughtworks. inc. All rights reserved.
//

import UIKit
//import WebImage

class MasterViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil
  var jsonTitle: NSString! = nil
  var jsonArray: NSArray! = nil


  override func awakeFromNib() {
    super.awakeFromNib()
    if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
      self.clearsSelectionOnViewWillAppear = false
      self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem()

    let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
    self.navigationItem.rightBarButtonItem = addButton
    if let split = self.splitViewController {
      let controllers = split.viewControllers
      self.detailViewController = controllers[controllers.count - 1].topViewController as? DetailViewController
    }
    get_json_data()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func insertNewObject(sender: AnyObject) {
  }

  // MARK: - Segues

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow() {
//        let object = FactInfo()
        let object = ""
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
        controller.detailItem = object
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }

  // MARK: - Table View

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jsonArray.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
    let row = jsonArray[indexPath.row] as! NSDictionary
    cell.labelName.text = jsonArray[indexPath.row]["title"] as? String
    cell.labelDescription.text = jsonArray[indexPath.row]["description"] as? String
    if let urlString = jsonArray[indexPath.row]["imageHref"] as? String {
      let imageUrl = NSURL(string: urlString)
      if let imageData = NSData(contentsOfURL: imageUrl!) {
        cell.imgAvater.image = UIImage(data: imageData)
      }
    }
    return cell
  }

  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }

  func get_json_data() {
    var error: NSError?
    if let path = NSBundle.mainBundle().pathForResource("facts", ofType: "json") {
      let jsonData: NSData = NSData(contentsOfFile: path)!
      let jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as! NSDictionary
      jsonTitle = jsonDict["title"] as! NSString
      jsonArray = jsonDict["rows"] as! NSArray
    }
  }

}

