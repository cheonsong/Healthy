//
//  CalendarView.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/26.
//

import Foundation
import UIKit
import Util
import Domain

public class CommitView: UIView {
    
    private let weeks = ["일","월","화","수","목","금","토"]
    private let days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    public var data: [DailyWaterModel] = []
    
    private let title = LabelBuilder("COMMIT_DATE_LABEL".localized([DateConverter.currentYear(), DateConverter.currentMonth().localized])).font(.bold16).textColor(.black).view
    
    private let stackView = StackViewBuilder().axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    
    private var flowLayout = UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 0
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 5
        $0.itemSize = CGSize(width: Const.calendarCellSize, height: Const.calendarCellSize)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.identifier)
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func set(data: [DailyWaterModel]) {
        self.data = data
        collectionView.reloadData()
    }
    
    func addComponents() {
        [title, collectionView].forEach { addSubview($0) }
    }
    
    func setConstraints() {
        title.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(10)
            $0.height.equalTo(Const.fullWidth / 7 * 5)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    func bind() {
        
    }
    
}

extension CommitView: UICollectionViewDelegate {
    
}

extension CommitView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days[Int(DateModel.today.month) ?? 0]
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
        
        let data = data.filter { model in
            Int(model.date!.day) ?? 0 == indexPath.row + 1
        }
        
        if data.first?.isAchieve ?? false {
            cell.commit.backgroundColor = .b2
        }
        
        return cell
    }
}
