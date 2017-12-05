//
//  DequeableCollectionView.swift
//  Dequable
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit

public protocol DequeableCollectionView: Dequeable {
  func dequeue(cellType: DequeableComponentIdentifiable.Type, atIndexPath indexPath: IndexPath) -> UICollectionViewCell
  func dequeue<T>(_ indexPath: IndexPath) -> T where T : UICollectionViewCell & DequeableComponentIdentifiable
}

public extension DequeableCollectionView where Self: UICollectionView {
    
  func dequeue(cellType: DequeableComponentIdentifiable.Type, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
      let identifier = cellType.dequableComponentIdentifier
      return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
  }
  
  func dequeue<T>(_ indexPath: IndexPath) -> T where T : UICollectionViewCell & DequeableComponentIdentifiable {
    return dequeueReusableCell(withReuseIdentifier: T.dequableComponentIdentifier, for: indexPath) as! T
  }
    
}
