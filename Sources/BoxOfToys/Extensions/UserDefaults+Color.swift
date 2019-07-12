import UIKit



public extension UserDefaults {
  func color(forKey defaultName: String) -> UIColor? {
    guard let data = data(forKey: defaultName) else {
      return nil
    }
    return NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
  }
  
  
  func set(_ value: UIColor, forKey defaultName: String) {
    let data = NSKeyedArchiver.archivedData(withRootObject: value)
    set(data, forKey: defaultName)
  }
}
