//
//  DequeableComponentIdentifiable.swift
//  Dequable
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import Foundation

public protocol DequeableComponentIdentifiable: class {
    static var dequableComponentIdentifier: String { get }
}

public extension DequeableComponentIdentifiable {
  
    static var dequableComponentIdentifier: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last! + "ID"
    }
    
}
