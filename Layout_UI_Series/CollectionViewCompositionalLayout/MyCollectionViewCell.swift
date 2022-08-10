//
//  MyCollectionViewCell.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/10.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myCollectionViewCellImg: UIImageView!
    @IBOutlet weak var myCollectionViewCellLabel: UILabel!
    var imageName: String = "" {
        didSet{
            print("MyCollectionViewCell / imageName - didSet() : \(imageName)")
            self.myCollectionViewCellImg.image = UIImage(systemName: imageName)
            self.myCollectionViewCellLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.966598928, green: 0.1191254333, blue: 1, alpha: 1)
        
    }
    
}
