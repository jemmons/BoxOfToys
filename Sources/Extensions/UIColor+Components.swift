import UIKit



public extension UIColor {
  convenience init(hex: UInt) {
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(hex & 0x0000FF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  
  var hex: UInt? {
    guard let (red, green, blue, _) = rgbaComponents() else {
      return nil
    }
    
    let redComp = UInt(red * 255) << 16
    let greenComp = UInt(green * 255) << 8
    let blueComp = UInt(blue * 255)
    
    return redComp + greenComp + blueComp
  }

  
  /// More swifty way of grabbing color components. Returns RGBA if `self` is in a workable colors space. Otherwise `nil`.
  func rgbaComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
      return nil
    }
    return (red: red, green: green, blue: blue, alpha: alpha)
  }
  
  
  func hsbaComponents() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)? {
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0
    guard getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
      return nil
    }
    return (hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
  }
}
