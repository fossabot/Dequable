//
//  DequeueMechanismIdentifiable.swift
//  Dequable
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit

public protocol Dequeable {
    func register(cellType: DequeableComponentIdentifiable.Type)
    func register(cellType: DequeableComponentIdentifiable.Type, hasNib: Bool)
}

public extension Dequeable {
    
    func register(cellType: DequeableComponentIdentifiable.Type) {
        register(cellType: cellType, hasNib: false)
    }
}

public extension Dequeable where Self: UITableView {
    
    func register(cellType: DequeableComponentIdentifiable.Type, hasNib: Bool) {
        let identifier = cellType.dequableComponentIdentifier
        if hasNib == true {
            let className = NSStringFromClass(cellType).components(separatedBy: ".").last!
            let nib = UINib(nibName: className, bundle: Bundle(for: cellType))
            register(nib, forCellReuseIdentifier: identifier)
        } else {
            register(cellType, forCellReuseIdentifier: identifier)
        }
    }
}

public extension Dequeable where Self: UICollectionView {
    
    func register(cellType: DequeableComponentIdentifiable.Type, hasNib: Bool) {
        let identifier = cellType.dequableComponentIdentifier
        if hasNib == true {
            let className = NSStringFromClass(cellType).components(separatedBy: ".").last!
            let nib = UINib(nibName: className, bundle: Bundle(for: cellType))
            register(nib, forCellWithReuseIdentifier: identifier)
        } else {
            register(cellType, forCellWithReuseIdentifier: identifier)
        }
    }
}
