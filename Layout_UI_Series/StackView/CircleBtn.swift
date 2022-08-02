//
//  CircleBtn.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/30.
//

import Foundation
import UIKit

// 인터페이스 빌더에서 디자인으로 확인 가능하게끔 설정.
@IBDesignable
class CircleBtn: UIButton {
    // IBInspectable 인스펙터 패널에서 사용될 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
