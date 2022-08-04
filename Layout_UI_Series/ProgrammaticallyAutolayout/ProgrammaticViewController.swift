//
//  ProgrammaticViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/02.
//

import UIKit


class ProgrammaticViewController: UIViewController {
    
    // MARK : - Properties
    
        // Views Using closure
    var mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    var myThirdView: UIView = {
        let view = MyCircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        // x축, y축 위치 (Anchor)
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
        // 뷰의 width, height
        myFirstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.layer.cornerRadius = 40
        
        
        self.view.addSubview(mySecondView)
        self.view.addSubview(myThirdView)
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 50),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 50),
//            myThirdView.widthAnchor.constraint(equalToConstant: 100),
            myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5),
            myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5),
            
            myThirdView.leadingAnchor.constraint(equalTo: mySecondView.trailingAnchor, constant: 0),
            myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 30)
        ])
        
//        mySecondViwe.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        mySecondViwe.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        mySecondViwe.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor).isActive = true
//        mySecondViwe.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 50).isActive = true
    }

}

// MARK : - 전처리기
#if DEBUG
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // makeUI
    @available(iOS 13, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        return ProgrammaticViewController()
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
#endif


