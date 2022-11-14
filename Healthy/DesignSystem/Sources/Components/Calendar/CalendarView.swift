//
//  CalendarView.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/26.
//

import Foundation
import UIKit
import Util

public class CalendarView: UIView {
    
    let weeks = ["일","월","화","수","목","금","토"]
    
    let title = LabelBuilder("2021년 11월").font(.bold16).textColor(.black).view
    
    let stackView = StackViewBuilder().axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    
    var flowLayout = UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 0
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 5
        $0.itemSize = CGSize(width: Const.calendarCellSize, height: Const.calendarCellSize)
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
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

extension CalendarView: UICollectionViewDelegate {
    
}

extension CalendarView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
        
        return cell
    }
}
