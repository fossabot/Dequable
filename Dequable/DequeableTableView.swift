//
//  DequeableTableView.swift
//  Dequable
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit

public protocol DequeableTableView: Dequeable {
    func register(headerFooterViewType: DequeableComponentIdentifiable.Type, hasNib: Bool)
    func dequeue<T>(_ indexPath: IndexPath) -> T where T : UITableViewCell & DequeableComponentIdentifiable
}

public extension DequeableTableView where Self: UITableView {
    
    func register(headerFooterViewType: DequeableComponentIdentifiable.Type, hasNib: Bool) {
        let identifier = headerFooterViewType.dequableComponentIdentifier
        if hasNib == true {
            let className = NSStringFromClass(headerFooterViewType).components(separatedBy: ".").last!
            let bundle = Bundle(for: headerFooterViewType)
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        } else {
            register(headerFooterViewType, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    func dequeue<T>(_ indexPath: IndexPath) -> T where T : UITableViewCell & DequeableComponentIdentifiable {
        return dequeueReusableCell(withIdentifier: T.dequableComponentIdentifier, for: indexPath) as! T
    }
}
