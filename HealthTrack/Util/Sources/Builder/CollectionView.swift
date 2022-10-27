//
//  CollectionView.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class CollectionView {
    open var view: UICollectionView
    
    public init (_ layout: UICollectionViewFlowLayout) {
        self.view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    open func delegate(_ delegate: UICollectionViewDelegate?)-> CollectionView {
        view.delegate = delegate
        return self
    }
    
    open func dataSource(_ dataSource: UICollectionViewDataSource?)-> CollectionView {
        view.dataSource = dataSource
        return self
    }
    
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier: String)-> CollectionView {
        view.register(cellClass, forCellWithReuseIdentifier: forCellWithReuseIdentifier)
        return self
    }
    
    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind: String, forCellWithReuseIdentifier: String)-> CollectionView {
        view.register(viewClass, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: forCellWithReuseIdentifier)
        return self
    }
    
    open func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?)-> CollectionView {
        view.prefetchDataSource = prefetchDataSource
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> CollectionView {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> CollectionView {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> CollectionView {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> CollectionView {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UICollectionView.ContentMode)-> CollectionView {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> CollectionView {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> CollectionView {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> CollectionView {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> CollectionView  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> CollectionView {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> CollectionView {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> CollectionView {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> CollectionView {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> CollectionView {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> CollectionView {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> CollectionView {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> CollectionView {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> CollectionView {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> CollectionView {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> CollectionView {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> CollectionView {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> CollectionView {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> CollectionView {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> CollectionView {
        view.anchorPoint = anchorPoint
        return self
    }
}
