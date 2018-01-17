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

extension DequeableComponentIdentifiable {
  
    public static var dequableComponentIdentifier: String {
        let className = NSStringFromClass(Self.self).components(separatedBy: ".").last!
        return className + "ID"
    }
    
}
