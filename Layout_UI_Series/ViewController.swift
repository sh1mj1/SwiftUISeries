//
//  ViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController{
    
    // MARK : - Properties
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    let categoryTableArray: [String] = [
        "Dynamic TableView",
        "ScrollView",
        "Constraint Priority",
        "Stack View",
        "Programmatically Preview",
        "SnapKit",
        "Programmatically anim",
        "CollectionView Compositional Layout",
        "TableView Diffable dataSource"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryTableArray.count
    }
    // tableView 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoryTableView.dequeueReusableCell(withIdentifier: "UICategoryTableViewCell") else {
            fatalError("There's no the such cell")
        }
        
        cell.textLabel?.text = self.categoryTableArray[indexPath.row]
        
        return cell
    }
    // Row 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Header 지정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Frequently used UI"
    }
    
    // 클릭한 Row Event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click Cell Number: " + String(indexPath.row))
        
        // indexPath에 따라 case를 하나하나 나누는 것 말고 다른 방법이 있을 듯 한데... 구조체??
        switch indexPath.row{
        case 0:
            if let controller = self.storyboard?.instantiateViewController(identifier: "DynamicTableViewController") {
                // 여기서 navigationController 이게 맨 앞에 있는 navigation임
                controller.title = "DynamicTableViewController"
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 1:
            if let controller = self.storyboard?.instantiateViewController(identifier: "ScrollViewController") {
                // 여기서 navigationController 이게 맨 앞에 있는 navigation임
                controller.title = "ScrollViewController"
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 2:
            if let controller = self.storyboard?.instantiateViewController(identifier: "ConstraintPriority") {
                // 여기서 navigationController 이게 맨 앞에 있는 navigation임
                controller.title = "ConstraintPriority"
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 3:
            if let controller = self.storyboard?.instantiateViewController(identifier: "StackViewController"){
                controller.title = "StackViewController"
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 4:
            if let controller = self.storyboard?.instantiateViewController(identifier: "ProgrammaticallyPreview"){
                controller.title = "ProgrammaticallyPreview"
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            
        default:
            print("Default")
        }
    }
}
