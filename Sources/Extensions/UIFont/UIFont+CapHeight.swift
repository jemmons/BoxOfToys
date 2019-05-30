import UIKit



internal extension UIFont.Constant {
  static let capPointFactor: CGFloat = {
    100.0 / UIFont.systemFont(ofSize: 100).capHeight
  }()
  
  
  static let boldCapPointFactor: CGFloat = {
    100.0 / UIFont.boldSystemFont(ofSize: 100).capHeight
  }()
  
  
  static let boldItalicCapPointFactor: CGFloat = {
    100.0 / UIFont.boldItalicSystemFont(ofSize: 100).capHeight
  }()
  
  
  static let blackItalicCapPointFactor: CGFloat = {
    100.0 / UIFont.blackItalicSystemFont(ofSize: 100).capHeight
  }()
}



public extension UIFont {
  static func systemFont(capHeight: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: capHeight * Constant.capPointFactor)
  }
  
  
  static func boldSystemFont(capHeight: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: capHeight * Constant.boldCapPointFactor)
  }
  
  
  static func boldItalicSystemFont(capHeight: CGFloat) -> UIFont {
    return UIFont.boldItalicSystemFont(ofSize: capHeight * Constant.boldItalicCapPointFactor)
  }
  
  
  static func blackItalicSystemFont(capHeight: CGFloat) -> UIFont {
    return UIFont.blackItalicSystemFont(ofSize: capHeight * Constant.blackItalicCapPointFactor)
  }
}
