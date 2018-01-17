//
//  DequeableCollectionView.swift
//  Dequable
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit

public protocol DequeableCollectionView: Dequeable {
    func register(_ headerFooterViewType: DequeableComponentIdentifiable.Type, forSupplementaryViewOfKind kind: String)
    func register(_ headerFooterViewType: DequeableComponentIdentifiable.Type, forSupplementaryViewOfKind kind: String, hasNib: Bool)
    func dequeue<T>(_ indexPath: IndexPath) -> T where T : UICollectionViewCell & DequeableComponentIdentifiable
}

public extension DequeableCollectionView where Self: UICollectionView {
    
    func register(_ headerFooterViewType: DequeableComponentIdentifiable.Type, forSupplementaryViewOfKind kind: String) {
        register(headerFooterViewType, forSupplementaryViewOfKind: kind, hasNib: false)
    }
    
    func register(_ headerFooterViewType: DequeableComponentIdentifiable.Type, forSupplementaryViewOfKind kind: String, hasNib: Bool) {
        let identifier = headerFooterViewType.dequableComponentIdentifier
        if hasNib == true {
            let className = NSStringFromClass(headerFooterViewType).components(separatedBy: ".").last!
            let nib = UINib(nibName: className, bundle: Bundle(for: headerFooterViewType))
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        } else {
            register(headerFooterViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        }
    }
    
    func dequeue<T>(_ indexPath: IndexPath) -> T where T : UICollectionViewCell & DequeableComponentIdentifiable {
      return dequeueReusableCell(withReuseIdentifier: T.dequableComponentIdentifier, for: indexPath) as! T
    }
}
