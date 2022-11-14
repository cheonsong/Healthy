//
//  CollectionViewFlowLayout.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class CollectionViewFlowLayoutBuilder {
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    public init() {}
    
    open func itemSize(_ size: CGSize)-> CollectionViewFlowLayoutBuilder {
        layout.itemSize = size
        return self
    }
    
    open func scrollDirection(_ direction: UICollectionView.ScrollDirection)-> CollectionViewFlowLayoutBuilder {
        layout.scrollDirection = direction
        return self
    }
    
    open func minimumLineSpacing(_ minimumLineSpacing: CGFloat)-> CollectionViewFlowLayoutBuilder {
        layout.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    open func minimumInteritemSpacing(_ minimumInteritemSpacing: CGFloat)-> CollectionViewFlowLayoutBuilder {
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    open func estimatedItemSize(_ estimatedItemSize: CGSize)-> CollectionViewFlowLayoutBuilder {
        layout.estimatedItemSize = estimatedItemSize
        return self
    }
    
    open func sectionInset(_ sectionInset: UIEdgeInsets)-> CollectionViewFlowLayoutBuilder {
        layout.sectionInset = sectionInset
        return self
    }
    
    open func sectionInsetReference(_ sectionInsetReference: UICollectionViewFlowLayout.SectionInsetReference)-> CollectionViewFlowLayoutBuilder {
        layout.sectionInsetReference = sectionInsetReference
        return self
    }
    
    open func headerReferenceSize(_ headerReferenceSize: CGSize)-> CollectionViewFlowLayoutBuilder {
        layout.headerReferenceSize = headerReferenceSize
        return self
    }
    
    func footerReferenceSize(_ footerReferenceSize: CGSize)-> CollectionViewFlowLayoutBuilder {
        layout.footerReferenceSize = footerReferenceSize
        return self
    }
    
    open func sectionHeadersPinToVisibleBounds(_ sectionHeadersPinToVisibleBounds: Bool)-> CollectionViewFlowLayoutBuilder {
        layout.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds
        return self
    }
    
    open func sectionFootersPinToVisibleBounds(_ sectionFootersPinToVisibleBounds: Bool)-> CollectionViewFlowLayoutBuilder {
        layout.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds
        return self
    }

}
