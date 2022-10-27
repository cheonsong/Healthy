//
//  CollectionViewFlowLayout.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

class CollectionViewFlowLayout {
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    func itemSize(_ size: CGSize)-> CollectionViewFlowLayout {
        layout.itemSize = size
        return self
    }
    
    func scrollDirection(_ direction: UICollectionView.ScrollDirection)-> CollectionViewFlowLayout {
        layout.scrollDirection = direction
        return self
    }
    
    func minimumLineSpacing(_ minimumLineSpacing: CGFloat)-> CollectionViewFlowLayout {
        layout.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    func minimumInteritemSpacing(_ minimumInteritemSpacing: CGFloat)-> CollectionViewFlowLayout {
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    func estimatedItemSize(_ estimatedItemSize: CGSize)-> CollectionViewFlowLayout {
        layout.estimatedItemSize = estimatedItemSize
        return self
    }
    
    func sectionInset(_ sectionInset: UIEdgeInsets)-> CollectionViewFlowLayout {
        layout.sectionInset = sectionInset
        return self
    }
    
    func sectionInsetReference(_ sectionInsetReference: UICollectionViewFlowLayout.SectionInsetReference)-> CollectionViewFlowLayout {
        layout.sectionInsetReference = sectionInsetReference
        return self
    }
    
    func headerReferenceSize(_ headerReferenceSize: CGSize)-> CollectionViewFlowLayout {
        layout.headerReferenceSize = headerReferenceSize
        return self
    }
    
    func footerReferenceSize(_ footerReferenceSize: CGSize)-> CollectionViewFlowLayout {
        layout.footerReferenceSize = footerReferenceSize
        return self
    }
    
    func sectionHeadersPinToVisibleBounds(_ sectionHeadersPinToVisibleBounds: Bool)-> CollectionViewFlowLayout {
        layout.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds
        return self
    }
    
    func sectionFootersPinToVisibleBounds(_ sectionFootersPinToVisibleBounds: Bool)-> CollectionViewFlowLayout {
        layout.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds
        return self
    }

}
