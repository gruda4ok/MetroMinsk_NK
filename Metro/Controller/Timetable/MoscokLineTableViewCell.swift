//
//  MoscokLineTableViewCell.swift
//  Metro
//
//  Created by air on 23.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit

class MoscokLineTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    
    @IBOutlet weak var ImageCell: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
