import UIKit
import BagOfTricks



public extension UIViewController {
  func embed(_ child: UIViewController, constraints: [NSLayoutConstraint] = []) {
    addChild(child)
    view.addSubview(child.view)
    if constraints.isNotEmpty {
      child.view.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate(constraints)
    }
    child.didMove(toParent: self)
  }
  
  
  @discardableResult func embedFullFrame(_ child: UIViewController, usesLayoutGuide: Bool = true) -> [NSLayoutConstraint] {
    return given(Helper.makeFullFrameConstraints(from: child, to: self, usesLayoutGuide: usesLayoutGuide)) {
      embed(child, constraints: $0)
    }
  }
  

  /// Removes `child` from view controller containment *if* `child` is contained. Otherwise is a no-op.
  func extract(_ child: UIViewController) {
    guard child.parent != nil else {
      return
    }
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}



private enum Helper {
  static func makeFullFrameConstraints(from child: UIViewController, to parent: UIViewController, usesLayoutGuide: Bool) -> [NSLayoutConstraint] {
    let constraints: [NSLayoutConstraint]
    switch usesLayoutGuide {
    case false:
      constraints = [
        child.view.topAnchor.constraint(equalTo: parent.view.topAnchor),
        child.view.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor),
        child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
        child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
      ]
      
    case true:
      if #available(iOS 11, *) {
        constraints = [
          child.view.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor),
          child.view.bottomAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.bottomAnchor),
          child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
          child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
        ]
        
      } else {
        constraints = [
          child.view.topAnchor.constraint(equalTo: parent.topLayoutGuide.bottomAnchor),
          child.view.bottomAnchor.constraint(equalTo: parent.bottomLayoutGuide.topAnchor),
          child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
          child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
        ]
      }
    }
    return constraints
  }
}
