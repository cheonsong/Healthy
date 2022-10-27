//
//  CollectionViewFlowLayout.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class CollectionViewFlowLayout {
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    public init() {}
    
    open func itemSize(_ size: CGSize)-> CollectionViewFlowLayout {
        layout.itemSize = size
        return self
    }
    
    open func scrollDirection(_ direction: UICollectionView.ScrollDirection)-> CollectionViewFlowLayout {
        layout.scrollDirection = direction
        return self
    }
    
    open func minimumLineSpacing(_ minimumLineSpacing: CGFloat)-> CollectionViewFlowLayout {
        layout.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    open func minimumInteritemSpacing(_ minimumInteritemSpacing: CGFloat)-> CollectionViewFlowLayout {
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    open func estimatedItemSize(_ estimatedItemSize: CGSize)-> CollectionViewFlowLayout {
        layout.estimatedItemSize = estimatedItemSize
        return self
    }
    
    open func sectionInset(_ sectionInset: UIEdgeInsets)-> CollectionViewFlowLayout {
        layout.sectionInset = sectionInset
        return self
    }
    
    open func sectionInsetReference(_ sectionInsetReference: UICollectionViewFlowLayout.SectionInsetReference)-> CollectionViewFlowLayout {
        layout.sectionInsetReference = sectionInsetReference
        return self
    }
    
    open func headerReferenceSize(_ headerReferenceSize: CGSize)-> CollectionViewFlowLayout {
        layout.headerReferenceSize = headerReferenceSize
        return self
    }
    
    func footerReferenceSize(_ footerReferenceSize: CGSize)-> CollectionViewFlowLayout {
        layout.footerReferenceSize = footerReferenceSize
        return self
    }
    
    open func sectionHeadersPinToVisibleBounds(_ sectionHeadersPinToVisibleBounds: Bool)-> CollectionViewFlowLayout {
        layout.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds
        return self
    }
    
    open func sectionFootersPinToVisibleBounds(_ sectionFootersPinToVisibleBounds: Bool)-> CollectionViewFlowLayout {
        layout.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds
        return self
    }

}
