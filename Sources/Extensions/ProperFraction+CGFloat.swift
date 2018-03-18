import UIKit
import BagOfTricks



public extension ProperFraction {
  init(_ fraction: CGFloat) throws {
    try self.init(Double(fraction))
  }
  
  
  init(clipping fraction: CGFloat) {
    self.init(clipping: Double(fraction))
  }
  
  
  var cgFloat: CGFloat {
    return CGFloat(value)
  }
}
