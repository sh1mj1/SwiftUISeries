//
//  StackViewPracticeController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/28.
//

import UIKit

class StackViewPracticeController: UIViewController {

    // MARK : - Properties
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet var phoneBtns: [CircleBtn]!
    @IBOutlet weak var phoneCallBtn: CircleBtn!
    
    var phoneNumberString = ""{
        didSet{
            // main Thread 에서 작업을 할 것. self을 약한 참조로 할 것이다.
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.phoneLabel.textColor = .black
                self.phoneLabel.text = self.phoneNumberString
            }
        }
    }
    
    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btnItem in phoneBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }
    
    // MARK : - Help
    
    @objc fileprivate func onNumberBtnClicked(sender: UIButton){
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton){
        phoneNumberString.removeAll()
    }
    

}
