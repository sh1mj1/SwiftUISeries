//
//  DiffableTableVC.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/11.
//

import UIKit



/*
 Diffable Data Source을 사용하려면 모델이 필요하다. 모델 -> class OR Struct
 일단 기본적인 방식 (2차원 배열 안쓴다.)
 1. enum 으로 section을 만든다.
 2 -1 클래스 uuid, content, static func, hash
 2 -2 스트럭트
 */

enum Section {
    case feed, post, board
}
// 클래스
class Feed: Hashable {
    // 고유 아이디
    let uuid: UUID = UUID()
    var content: String
    init(content: String){
        self.content = content
    }
    //
    static func == (lhs: Feed, rhs: Feed) -> Bool{
        lhs.uuid == rhs.uuid
    }
    
    //
    func hash(into hasher: inout Hasher){
        hasher.combine(uuid)
    }
    
}
// 스트럭트 - struct 는 바로 Hashable을 준수하게 된다. 왜냐하면 struct는 새로운 값이니까..?
struct Post: Hashable{
    var content: String
}

class DiffableTableVC: UIViewController {
    
    // MARK : - Properties
    var appendCount = 0
    // 1. TableView - 구성품
    @IBOutlet weak var diffTableView: UITableView!
    
    // 2. 데이터소스 - 구성품 (UITableViewDataSource Delegat을 대체)
    var dataSource: UITableViewDiffableDataSource<Section, Feed>!
    // 3. SnapShot - 구성품 (현재의 데이터 상태)
    var snapshot: NSDiffableDataSourceSnapshot<Section, Feed>!
    var feedArray = [
        Feed(content: "We did not change as we grew older we just became more clearly ourselves."),
        Feed(content: "It is better to fail in originality than to succeed in imitation."),
        Feed(content: "Success is walking from failure to failure with no loss of enthusiasm."),
        Feed(content: "We did not123123 change as we grew older we just became more clearly ourselves."),
        Feed(content: "It is bett123123er to fail in originality than to succeed in imitation."),
        Feed(content: "Success i123123s walking from failure to failure with no loss of enthusiasm."),
        Feed(content: "We did not123123 change as we grew older we just 123became more clearly ourselves."),
        Feed(content: "It is bett123123er to fail in originality than to s123ucceed in imitation."),
        Feed(content: "Success i123123s walking from failure to failure wi123th no loss of enthusiasm."),
        Feed(content: "He that is discontented in one place will seldom be happy in another. Joy is not in things. It is in us. Slow down and enjoy life. It's not only the scenery you miss by going too fast, you also miss the scene of where you are going and why.Things won are done. joy's soul lies in doing.The foolish man seeks happiness in the distance, the wise grows it under his feet. The foolish man seeks happiness in the distance, the wise grows it under his feet.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 셀 리소스 파일
        let diffTVCellNib = UINib(nibName: String(describing: DiffableTVCell.self), bundle: nil)
        
        // 셀 리소스 등록
        self.diffTableView.register(diffTVCellNib, forCellReuseIdentifier: "DiffableTVCell")
        self.diffTableView.rowHeight = UITableView.automaticDimension
        self.diffTableView.estimatedRowHeight = 120
        
        self.diffTableView.delegate = self
        //        self.diffTableView.dataSource = self
        print("feedArray.count : \(feedArray.count)")
        
        // MARK : - DataSource
        /*
         // 공식 문서 복붙. Int == Section , UUID == Item
         dataSource = UITableViewDiffableDataSource<Int, UUID>(tableView: tableView) {
         (tableView: UITableView, indexPath: IndexPath, itemIdentifier: UUID) -> UITableViewCell? in
         // configure and return cell
         }
         */
        dataSource = UITableViewDiffableDataSource<Section, Feed>(tableView: self.diffTableView, cellProvider:{
            (tableView: UITableView, indexPath: IndexPath, itemIdentifier: Feed) -> UITableViewCell? in
            // configure and return cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiffableTVCell", for: indexPath) as! DiffableTVCell
            cell.commentLabel.text = itemIdentifier.content
            
            return cell
        })
        // MARK : - SnapShot == 데이터 소스의 현재 스냅샷을 만든다.
        snapshot = NSDiffableDataSourceSnapshot<Section, Feed>()
        
        // Section 추가
        snapshot.appendSections([.feed])
        
        // insert Items in Sections
        snapshot.appendItems(feedArray,toSection: .feed)
        
        // display snapshot in UI
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
    
    // MARK : - Actions
    @IBAction func deleteLastFeed(_ sender: Any) {
        
        if let lastItem = snapshot.itemIdentifiers.last {
            snapshot.deleteItems([lastItem])
        }
        dataSource.apply(snapshot)
    }
    
    
    
    @IBAction func appendFeed(_ sender: Any) {
        print("appendFeed")
        
        snapshot.appendItems([Feed(content: "ABCABCBABCACBAB\(appendCount)")])
        appendCount += 1
        dataSource.apply(snapshot)
        
    }
    
}

extension DiffableTableVC: UITableViewDelegate {
    
}

//extension DiffableTableVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return feedArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = diffTableView.dequeueReusableCell(withIdentifier: "DiffableTVCell", for: indexPath) as? DiffableTVCell else { return UITableViewCell() }
//        cell.commentLabel.text = feedArray[indexPath.row]
//
//        return cell
//    }
//}
