import Foundation

public protocol DequeableComponentIdentifiable: class {
    static var dequableComponentIdentifier: String { get }
}

public extension DequeableComponentIdentifiable {
  
    static var dequableComponentIdentifier: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last! + "ID"
    }
    
}
