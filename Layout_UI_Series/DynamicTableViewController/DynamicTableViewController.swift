//
//  DynamicTableViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/22.
//

import UIKit

class DynamicTableViewController: UIViewController {
    
    // MARK : - Properties
    @IBOutlet weak var dynamicTableView: UITableView!
    let comments = [
        "We did not change as we grew older we just became more clearly ourselves.",
        "It is better to fail in originality than to succeed in imitation.",
        "Success is walking from failure to failure with no loss of enthusiasm.",
        "He that is discontented in one place will seldom be happy in another. Joy is not in things. It is in us. Slow down and enjoy life. It's not only the scenery you miss by going too fast, you also miss the scene of where you are going and why.Things won are done. joy's soul lies in doing.The foolish man seeks happiness in the distance, the wise grows it under his feet."
    ]
    
    // MARK : - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Nib 를 Identifier 가 "FeedTableViewCell" 인 것으로 선언
        let dynamicNib = UINib(nibName: "DynamicTableViewCell", bundle: nil)
//        let dynamicNib = UINib(nibName: String(describing: DynamicTableViewCell.self), bundle: nil)
        // 해당 Nib 을 tableView 에 지정하기
        dynamicTableView.register(dynamicNib, forCellReuseIdentifier: "DynamicTableViewCell")
        
        self.dynamicTableView.rowHeight = UITableView.automaticDimension
        self.dynamicTableView.estimatedRowHeight = 120
        
        dynamicTableView.delegate = self
        dynamicTableView.dataSource = self
        
    }
}

extension DynamicTableViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dynamicTableView.dequeueReusableCell(withIdentifier: "DynamicTableViewCell", for: indexPath) as? DynamicTableViewCell else {
            return UITableViewCell()
        }
        cell.commentLabel.text = comments[indexPath.row]
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
    
}
