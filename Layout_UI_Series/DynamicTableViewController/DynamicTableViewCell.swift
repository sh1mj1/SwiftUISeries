//
//  DynamicTableViewCell.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/22.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    // MARK : - Properties
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK : - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
