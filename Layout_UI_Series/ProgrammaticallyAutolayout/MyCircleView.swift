//
//  MyCircleView.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/02.
//

import Foundation
import UIKit

class MyCircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView - layoutSubviews() called")
        self.layer.cornerRadius = self.frame.height / 2
        
    }
}
