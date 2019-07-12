import UIKit



public extension UIViewController {
  func makeRootViewController(animated: Bool = true) {
    guard let window = UIApplication.shared.keyWindow else {
      return
    }
    
    if let controller = window.rootViewController,
      controller.hasPresentedController {
      controller.dismiss(animated: false, completion: nil)
    }
    
    window.rootViewController = self
    if animated {
      window.layer.add(CATransition(), forKey: nil)
    }
  }
}



private extension UIViewController {
  var hasPresentedController: Bool {
    return presentedViewController != nil
  }
}
