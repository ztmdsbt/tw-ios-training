//
//  FactInfo.swift
//  json-data
//
//  Created by Kaihang An on 7/2/15.
//  Copyright (c) 2015 Thoughtworks. inc. All rights reserved.
//

import UIKit

class FactInfo {
  var title: String?, descrtiption: String?, avatar: UIImage?

  init(title: String?, descrtiption: String?, avatar: UIImage?) {
    self.title = title
    self.descrtiption = descrtiption
    self.avatar = avatar
  }
}
