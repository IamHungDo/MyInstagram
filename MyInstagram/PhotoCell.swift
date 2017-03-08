//
//  PhotoCell.swift
//  MyInstagram
//
//  Created by Hung Do on 3/6/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet var postImage: PFImageView!
    
    
    var postObj : PFObject! {
        
        didSet {
            if postObj["media"] != nil {
            self.postImage.file = postObj["media"] as? PFFile
            self.postImage.loadInBackground()
//            self.captionLabel.text = postObj["caption"] as! String!
            } else {
                
            }
        }
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        }
    

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
