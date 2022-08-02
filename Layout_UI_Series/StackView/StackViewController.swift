//
//  StackViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/27.
//

import UIKit

class StackViewController: UIViewController {

    // MARK : - Properties
    
    
    // MARK : - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK : - Actions
    
    @IBAction func stackViewErrorBtn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "StackViewErrorController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func stackViewPracticeBtn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "StackViewPracticeController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    //    @IBAction func stackViewPracticeBtn(_ sender: Any) {
//        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "StackViewPracticeController"){
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//    }
    
    

    

}


