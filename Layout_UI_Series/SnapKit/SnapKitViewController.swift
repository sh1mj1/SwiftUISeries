//
//  SnapKitViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/05.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {
    
    // MARK : - Properties
    lazy var yelloBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }() // 괄호 () 로서 lazy var greenBox 가 바로 나오게 되는 것..?
    lazy var greenBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    lazy var redBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
//    lazy var blueBox = { () -> UIView in
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()
    // blueBox 을 blueButton으로 만들기
    lazy var myBtn = { (color: UIColor) -> UIButton in
        let btn = UIButton(type: .system)
        btn.backgroundColor = color
        btn.setTitle("Button ", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }
    
    
    lazy var brownBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()

    
    // Snapkit 을 사용하지 않을 때 - Event
    var brownBoxTopNSLayoutConstraint: NSLayoutConstraint? = nil
    // Snapkit 을 사용했을 때 - Event
    var brownBoxTopConstraint: Constraint? = nil
    
    
    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(greenBox)
        self.view.addSubview(redBox)
        self.view.addSubview(yelloBox)
//        self.view.addSubview(blueBox)
        self.view.addSubview(brownBox)
        let myDarkGrayBtn = myBtn(.darkGray)
        self.view.addSubview(myDarkGrayBtn)

        //             Snapkit 을 사용하지 않았을 때 Autolayout Constraint {
//        yelloBox.translatesAutoresizingMaskIntoConstraints = false
//        greenBox.translatesAutoresizingMaskIntoConstraints = false
//        redBox.translatesAutoresizingMaskIntoConstraints = false
//        blueBox.translatesAutoresizingMaskIntoConstraints = false
//        brownBox.translatesAutoresizingMaskIntoConstraints = false
//
//        yelloBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        yelloBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        yelloBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
//        yelloBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -520).isActive = true
//
//        greenBox.leadingAnchor.constraint(equalTo: self.yelloBox.leadingAnchor, constant: 20).isActive = true
//        greenBox.trailingAnchor.constraint(equalTo: self.yelloBox.trailingAnchor, constant: -20).isActive = true
//        greenBox.topAnchor.constraint(equalTo: self.yelloBox.bottomAnchor, constant: 20).isActive = true
//        greenBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -420).isActive = true
//
        // Snapkit 을 사용하지 않을 때 - Event
            // 즉, 버튼을 눌렀을 때 brownBox가 아래로 움직이기 위해서 brownBoxTopNSLayoutConstraint 이라는 변수를 두고 해당 변수가 Active - true 이게 하기
//        brownBoxTopNSLayoutConstraint = brownBox.topAnchor.constraint(equalTo: self.yelloBox.bottomAnchor, constant: 20)
//        NSLayoutConstraint.activate([
//            brownBox.widthAnchor.constraint(equalToConstant: 200),
//            brownBox.heightAnchor.constraint(equalToConstant: 200),
//            brownBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//
//        ])
//        brownBoxTopNSLayoutConstraint?.isActive = true
//
//        redBox.leadingAnchor.constraint(equalTo: self.greenBox.leadingAnchor, constant: 20).isActive = true
//        redBox.trailingAnchor.constraint(equalTo: self.greenBox.trailingAnchor, constant: -20).isActive = true
//        redBox.topAnchor.constraint(equalTo: self.greenBox.bottomAnchor, constant: 20).isActive = true
//        redBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -220).isActive = true
//
//        blueBox.leadingAnchor.constraint(equalTo: self.redBox.leadingAnchor, constant: 20).isActive = true
//        blueBox.trailingAnchor.constraint(equalTo: self.redBox.trailingAnchor, constant: -20).isActive = true
//        blueBox.topAnchor.constraint(equalTo: self.redBox.bottomAnchor, constant: 20).isActive = true
//        blueBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
//         Snapkit 을 사용하지 않았을 때 }

        
//         Snapkit 을 사용했을 때
//             brownBox
        brownBox.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
            self.brownBoxTopConstraint = make.top.equalTo(yelloBox.snp.bottom).offset(20).constraint
        }
                //        brownBoxTopNSLayoutConstraint = brownBox.topAnchor.constraint(equalTo: self.yelloBox.bottomAnchor, constant: 20)
        
        yelloBox.snp.makeConstraints { make in
//            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 520, right: 20))
        }
        greenBox.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.top.equalTo(yelloBox.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view).offset(-420)
            make.width.equalTo(300)
        }
        redBox.snp.makeConstraints { make in
            make.top.equalTo(greenBox.snp.bottom).offset(20)
            make.bottom.equalTo(self.view).offset(-220)
            make.leading.equalTo(greenBox.snp.leading).offset(20)
            make.trailing.equalTo(greenBox.snp.trailing).offset(-20)
        }

//        blueBox.snp.makeConstraints { make in
//            make.top.equalTo(redBox.snp.bottom).offset(20)
//            make.leading.equalTo(redBox.snp.leading).offset(20)
//            make.trailing.equalTo(redBox.snp.trailing).offset(-20)
//            make.bottom.equalTo(self.view).offset(-50)
//        }
        
        myDarkGrayBtn.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        myDarkGrayBtn.addTarget(self, action: #selector(moveBrownBoxDown), for: .touchUpInside)
        
        yelloBox.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        
    }
    
    // MARK : - Actions
    var offset = 0
    
    @objc fileprivate func moveBrownBoxDown(){
        offset += 40
        print("SnapKitViewController - moveBrownBoxDown() called, offset : \(offset)")
            // Snapkit 사용 안할 때
        self.brownBoxTopNSLayoutConstraint?.constant = CGFloat(offset)
            // Snapkit 사용할 때
        self.brownBoxTopConstraint?.update(offset: offset)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
    }

}

// MARK : - Preview

#if DEBUG
import SwiftUI

struct SnapKitVCRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        SnapKitViewController()
    }
}

@available(iOS 13.0, *)
struct SnapKitVCRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SnapKitVCRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}


#endif

