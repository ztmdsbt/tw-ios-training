//
//  DetailViewController.swift
//  json-data
//
//  Created by Kaihang An on 6/23/15.
//  Copyright (c) 2015 Thoughtworks. inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var labelTtitle: UILabel!

  @IBOutlet weak var imageAvatar: UIImageView!

  @IBOutlet weak var labelDescription: UILabel!

  var detailItem: AnyObject? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let detail: FactInfo = self.detailItem as? FactInfo {
     if let description  = self.labelDescription{
        description.text = detail.descrtiption
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

