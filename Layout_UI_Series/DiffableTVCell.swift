//
//  DiffableTVCell.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/11.
//

import UIKit

class DiffableTVCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
