//
//  CollectionView.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class CollectionViewBuilder {
    open var view: UICollectionView
    
    public init (_ layout: UICollectionViewFlowLayout) {
        self.view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    open func delegate(_ delegate: UICollectionViewDelegate?)-> CollectionViewBuilder {
        view.delegate = delegate
        return self
    }
    
    open func dataSource(_ dataSource: UICollectionViewDataSource?)-> CollectionViewBuilder {
        view.dataSource = dataSource
        return self
    }
    
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier: String)-> CollectionViewBuilder {
        view.register(cellClass, forCellWithReuseIdentifier: forCellWithReuseIdentifier)
        return self
    }
    
    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind: String, forCellWithReuseIdentifier: String)-> CollectionViewBuilder {
        view.register(viewClass, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: forCellWithReuseIdentifier)
        return self
    }
    
    open func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?)-> CollectionViewBuilder {
        view.prefetchDataSource = prefetchDataSource
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> CollectionViewBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> CollectionViewBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> CollectionViewBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> CollectionViewBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UICollectionView.ContentMode)-> CollectionViewBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> CollectionViewBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> CollectionViewBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> CollectionViewBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> CollectionViewBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> CollectionViewBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> CollectionViewBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> CollectionViewBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> CollectionViewBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> CollectionViewBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> CollectionViewBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> CollectionViewBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> CollectionViewBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> CollectionViewBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> CollectionViewBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> CollectionViewBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> CollectionViewBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> CollectionViewBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> CollectionViewBuilder {
        view.transform3D = transform3D
        return self
    }

}
