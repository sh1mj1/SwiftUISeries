//
//  ProgrammaticallyAnim.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/08.
//

import UIKit
import SnapKit

class ProgrammaticallyAnimViewController: UIViewController {
    
    // MARK : - Properties
    lazy var movingBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    lazy var myBtn = { (btnLabel: String) -> UIButton in
        let btn = UIButton(type: .system)
        btn.setTitle(btnLabel, for: .normal)
        btn.backgroundColor = .gray
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }
    
    var movingBoxTopConstraint: Constraint? = nil
    var movingBoxLeadingConstraint: Constraint? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(movingBox)
        let myLeftBtn = myBtn("Left")
        let myRightBtn = myBtn("Right")
        let myUpBtn = myBtn("Up")
        let myDownBtn = myBtn("Down")
        self.view.addSubview(myLeftBtn)
        self.view.addSubview(myRightBtn)
        self.view.addSubview(myUpBtn)
        self.view.addSubview(myDownBtn)
        
        movingBox.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            self.movingBoxTopConstraint = make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(200).constraint
            self.movingBoxLeadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(150).constraint

        }
        
        myRightBtn.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        myDownBtn.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.equalTo(myRightBtn.snp.leading)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        myLeftBtn.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.equalTo(myDownBtn.snp.leading)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        myUpBtn.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.equalTo(myRightBtn.snp.leading)
            make.bottom.equalTo(myRightBtn.snp.top)
        }
        myRightBtn.addTarget(self, action: #selector(moveBoxRight), for: .touchUpInside)
        myLeftBtn.addTarget(self, action: #selector(moveBoxLeft), for: .touchUpInside)
        myUpBtn.addTarget(self, action: #selector(moveBoxUp), for: .touchUpInside)
        myDownBtn.addTarget(self, action: #selector(moveBoxDown), for: .touchUpInside)
        
    }
    

    
    
    
    
    // MARK : - Helpers
    var offsetVertical = 200
    var offsetHorizontal = 150
    
    
    @objc fileprivate func moveBoxDown(){
        offsetVertical += 40
        print("ProgrammaticallyAnimViewController - moveBoxUp() called, offsetVertical : \(offsetVertical)")
        self.movingBoxTopConstraint?.update(offset: offsetVertical)
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
    }
    @objc fileprivate func moveBoxUp(){
        offsetVertical -= 40
        print("ProgrammaticallyAnimViewController - moveBoxUp() called, offsetVertical : \(offsetVertical)")
        self.movingBoxTopConstraint?.update(offset: offsetVertical)
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
        
        
    }
    @objc fileprivate func moveBoxRight(){
        offsetHorizontal += 40
        print("ProgrammaticallyAnimViewController - moveBoxRight() called, offsetHorizontal : \(offsetHorizontal)")
        self.movingBoxLeadingConstraint?.update(offset: offsetHorizontal)
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
    }
    
    @objc fileprivate func moveBoxLeft(){
        offsetHorizontal -= 40
        print("ProgrammaticallyAnimViewController - moveBoxLeft() called, offsetHorizontal : \(offsetHorizontal)")
        self.movingBoxLeadingConstraint?.update(offset: offsetHorizontal)
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
    }
    
    
}


// MARK : - DEBUG Preview

#if DEBUG
import SwiftUI

struct AnimVCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ProgrammaticallyAnimViewController()
    }
}

@available(iOS 13.0, *)
struct AnimVCRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            AnimVCRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("PREVIEW")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}



#endif
