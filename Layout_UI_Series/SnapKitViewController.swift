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
    }()
    lazy var greenBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .green
        return view
    }() // 괄호 () 로서 lazy var greenBox 가 바로 나오게 되는 것..?
    lazy var redBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    lazy var blueBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(greenBox)
        self.view.addSubview(redBox)
        self.view.addSubview(yelloBox)
        self.view.addSubview(blueBox)
        
        yelloBox.translatesAutoresizingMaskIntoConstraints = false
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.translatesAutoresizingMaskIntoConstraints = false
        blueBox.translatesAutoresizingMaskIntoConstraints = false
        
        // yelloBox 을 직접 코드로 하나하나 작성했을 때 아래와 같다.
            // Snapkit 을 사용하지 않았을 때 Autolayout Constraint
        yelloBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        yelloBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        yelloBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        yelloBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -520).isActive = true
//
//        greenBox.leadingAnchor.constraint(equalTo: self.yelloBox.leadingAnchor, constant: 20).isActive = true
//        greenBox.trailingAnchor.constraint(equalTo: self.yelloBox.trailingAnchor, constant: -20).isActive = true
//        greenBox.topAnchor.constraint(equalTo: self.yelloBox.bottomAnchor, constant: 20).isActive = true
//        greenBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -420).isActive = true
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
        
        // Snapkit 을 사용했을 때
        yelloBox.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }

//        yelloBox.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//        }
        
        
    }
    
    
    // MARK : - Actions
    
    
    
    // MARK : - Help
    
}

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

