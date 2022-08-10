//
//  MyTableViewCell.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/09.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    // MARK : - Properties
    
    @IBOutlet weak var myTableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
