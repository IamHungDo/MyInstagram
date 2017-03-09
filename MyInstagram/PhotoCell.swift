//
//  PhotoCell.swift
//  MyInstagram
//
//  Created by Hung Do on 3/6/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit
import Parse


class PhotoCell: UITableViewCell {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var img: PFObject! {
        didSet {
            captionLabel.text = img.object(forKey: "caption") as? String
            
            let imageData = img.object(forKey: "media") as? PFFile
            imageData?.getDataInBackground(block: { (imageinfo: Data?, error: Error?) in
                if(error == nil) {
                    let picture = UIImage(data: imageinfo!)
                    self.posterView.image = picture
                }
            })
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
