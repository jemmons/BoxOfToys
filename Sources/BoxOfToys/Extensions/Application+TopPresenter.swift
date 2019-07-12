import UIKit


public extension UIApplication {
  func findTopPresenter() -> UIViewController? {
    guard var topController = UIApplication.shared.keyWindow?.rootViewController else {
      return nil
    }

    while let presentedController = topController.presentedViewController {
      topController = presentedController
    }
    
    return topController
  }
}



