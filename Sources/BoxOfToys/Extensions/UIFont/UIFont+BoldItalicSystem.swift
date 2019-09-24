import UIKit



internal extension UIFont.Constant {
  static let boldItalicDescriptor: UIFontDescriptor? = {
    return UIFont.systemFont(ofSize: 12).fontDescriptor.withSymbolicTraits([.traitItalic, .traitBold])
  }()
  
  
  static let blackItalicDescriptor: UIFontDescriptor? = {
    return UIFont.systemFont(ofSize: 12, weight: .black).fontDescriptor.withSymbolicTraits([.traitItalic, .traitBold])
  }()
}



public extension UIFont {
  static func boldItalicSystemFont(ofSize size: CGFloat) -> UIFont {
    guard let descriptor = Constant.boldItalicDescriptor else {
      return UIFont.boldSystemFont(ofSize: size)
    }
    return UIFont(descriptor: descriptor, size: size)
  }
  
  
  static func blackItalicSystemFont(ofSize size: CGFloat) -> UIFont {
    guard let descriptor = Constant.blackItalicDescriptor else {
      return UIFont.systemFont(ofSize: size, weight: .black)
    }
    return UIFont(descriptor: descriptor, size: size)
  }
}
