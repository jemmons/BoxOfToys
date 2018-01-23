import UIKit



public extension UIColor {
  convenience init(hex: UInt) {
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(hex & 0x0000FF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  
  var hex: UInt? {
    var red : CGFloat = 0
    var green : CGFloat = 0
    var blue : CGFloat = 0
    guard getRed(&red, green: &green, blue: &blue, alpha: nil) else {
      return nil
    }
    
    let redComp = UInt(red * 255) << 16
    let greenComp = UInt(green * 255) << 8
    let blueComp = UInt(blue * 255)
    
    return redComp + greenComp + blueComp
  }
}
