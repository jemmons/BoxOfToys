import UIKit



public extension UIView {
  var isVisible: Bool {
    get {
      return !isHidden
    }
    set {
      isHidden = !newValue
    }
  }
}
