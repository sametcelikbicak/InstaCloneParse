//
//  feedCell.swift
//  InstaCloneParse
//
//  Created by Samet ÇELİKBIÇAK on 16.09.2017.
//  Copyright © 2017 Samet ÇELİKBIÇAK. All rights reserved.
//

import UIKit

class feedCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCommentText: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postUuidLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        postUuidLabel.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
