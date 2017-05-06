import UIKit
import BagOfTricks



public extension UIViewController {
  func embed(_ child: UIViewController, constraints: [NSLayoutConstraint] = []) {
    addChildViewController(child)
    view.addSubview(child.view)
    if constraints.isNotEmpty {
      child.view.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate(constraints)
    }
    child.didMove(toParentViewController: self)
  }
  
  
  @discardableResult func embedFullFrame(_ child: UIViewController) -> [NSLayoutConstraint] {
    return given(Helper.makeFullFrameConstraints(from: child, to: self)) {
      embed(child, constraints: $0)
    }
  }
  
  
  func remove(_ child: UIViewController, constraints: [NSLayoutConstraint] = []) {
    child.willMove(toParentViewController: nil)
    NSLayoutConstraint.deactivate(constraints)
    child.view.removeFromSuperview()
    child.removeFromParentViewController()
  }
}



private enum Helper {
  static func makeFullFrameConstraints(from child: UIViewController, to parent: UIViewController) -> [NSLayoutConstraint] {
    return [
      child.view.topAnchor.constraint(equalTo: parent.topLayoutGuide.bottomAnchor),
      child.view.bottomAnchor.constraint(equalTo: parent.bottomLayoutGuide.topAnchor),
      child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
      child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
    ]
  }
}
