import UIKit



enum Util {
  static func withNewRootController(while f: (UIViewController)->Void) {
    let oldWindow = UIApplication.shared.keyWindow
    defer {
      oldWindow?.makeKeyAndVisible()
    }
    
    let newWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let root = UIViewController()
    newWindow.rootViewController = root
    newWindow.makeKeyAndVisible()
    f(root)
  }
}
