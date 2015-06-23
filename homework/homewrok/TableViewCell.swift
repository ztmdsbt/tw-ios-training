//
//  TableViewCell.swift
//  homewrok
//
//  Created by Kaihang An on 6/9/15.
//  Copyright (c) 2015 Thoughtworks. inc. All rights reserved.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    var jsonData:JsonData?
    
    @IBOutlet weak var avterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.text = self.jsonData?.title as? String
        self.detailLabel.text = self.jsonData?.detail as? String
        var avterUrl = self.jsonData?.avter as? String
//        let url:NSURL? = NSURL.URLWithString(avterUrl)
//        if (url != nil) {
//            self.avterImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "avter"))
//        }
    }
}
