//
//  MyCollectionVCViewController.swift
//  Layout_UI_Series
//
//  Created by 심지훈 on 2022/08/10.
//

import UIKit

class MyCollectionVCViewController: UIViewController {

    // MARK : - Properties
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    fileprivate let systemImageNameArray = [
    "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill","tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"] // SF symbols 에 있는 이미지 들
    
    
    // MARK : - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyCollectionViewController - viewDidLoad() called")

        // collectionview 설정
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // 사용할 collectionView cell 등록
            // 닙파일 가져오기
        let myCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
//        let myCollectionViewCellNib = UINib(nibName: "MyCustomCollectionViewCell", bundle: nil)
        
            // 가져온 닙파일로 collectionview에 셀로 등록
        self.myCollectionView.register(myCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
        // CollectionViewLayout 적용
        self.myCollectionView.collectionViewLayout = createCompositionalLayout(1, 1)
    }

    // MARK : - Action
    @IBAction func onCollectionViewTypechanged(_ sender: UISegmentedControl) {
        print("MyCollectionVCViewController - onCollectionViewTypeChanged() called sender: \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(1, 1)
        case 1:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(1, 2)
        case 2:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(1, 3)
        default:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(1, 1)
        }
    }
    
}

// MARK : - CollectionViewLayout == 섹션 간 간격, 그룹 간 간격 등을 설정할 수 있다.
extension MyCollectionVCViewController {
    // Compositional Layout 설정
    fileprivate func createCompositionalLayout(_ itemFractionWidth: CGFloat, _ itemCount: Int) -> UICollectionViewLayout {
        print("MyCollectionVCViewController - createCompositionalLayoutForFirst() called")
        // Compositional Layout 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어온다. 반환하는 것은 NSCollectionLayoutSection.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // the size of item
                // --- Dimension - absolute = 고정값, estimate = 추측, fraction = 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFractionWidth), heightDimension: .fractionalWidth(1/3))
            
            // itemSize 로 item 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // item 간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            
            // 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: item, count: 1)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: itemCount)
            
            // section with group
            let section = NSCollectionLayoutSection(group: group)
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
            
        }
        print(itemFractionWidth)
        
        return layout
    }
    
    fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
        print("MyCollectionVCViewController - createCompositionalLayoutForSecond() called")
        // Compositional Layout 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어온다. 반환하는 것은 NSCollectionLayoutSection.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            // the size of item
                // --- Dimension - absolute = 고정값, estimate = 추측, fraction = 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1/3))

            // itemSize 로 item 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            // item 간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)

            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item], count: 2)

            // section with group
            let section = NSCollectionLayoutSection(group: group)

            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

            return section

        }


        return layout
    }
    fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
        // Compositional Layout 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어온다. 반환하는 것은 NSCollectionLayoutSection.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            // the size of item
                // --- Dimension - absolute = 고정값, estimate = 추측, fraction = 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3))

            // itemSize 로 item 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            // item 간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)

            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])

            // section with group
            let section = NSCollectionLayoutSection(group: group)

            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

            return section

        }

        return layout
    }
    
}

// MARK : - CollectionView Delegate, DataSource
extension MyCollectionVCViewController: UICollectionViewDelegate {
    // 액션에 관련
    
}
extension MyCollectionVCViewController: UICollectionViewDataSource {
    // 데이터와 관련
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: MyCollectionViewCell.self)
        let cellId2 = String(describing: MyCustomCollectionViewCell.self)
        // 셀의 Instance
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        // 셀의 Instance2
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! MyCustomCollectionViewCell
        
        cell.imageName = self.systemImageNameArray[indexPath.item]
        cell2.imageName = self.systemImageNameArray[indexPath.item]
        
        cell.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = #colorLiteral(red: 0.966598928, green: 0.1191254333, blue: 1, alpha: 1)
        
        
//        cell.myCollectionViewCellImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
//        cell.myCollectionViewCellLabel.text = self.systemImageNameArray[indexPath.item]
//        
        return cell2
    }
    
    
}
