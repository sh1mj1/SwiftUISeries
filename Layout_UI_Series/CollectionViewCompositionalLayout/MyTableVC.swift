//
//  MyTableVC.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/09.
//

import Foundation
import UIKit

class MyTableVC: UIViewController {
    
    // MARK : - Properties
    @IBOutlet weak var myTableView: UITableView!
    let comments = [
        "We did not change as we grew older we just became more clearly ourselves.",
        "It is better to fail in originality than to succeed in imitation.",
        "Success is walking from failure to failure with no loss of enthusiasm.",
        "He that is discontented in one place will seldom be happy in another. Joy is not in things. It is in us. Slow down and enjoy life. It's not only the scenery you miss by going too fast, you also miss the scene of where you are going and why.Things won are done. joy's soul lies in doing.The foolish man seeks happiness in the distance, the wise grows it under his feet."
    ]

    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let compoNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        
        myTableView.register(compoNib, forCellReuseIdentifier: "MyTableViewCell")
        

        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    
}


extension MyTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        cell.myTableLabel.text = comments[indexPath.row]
        return cell
    }
    
    
    
}
