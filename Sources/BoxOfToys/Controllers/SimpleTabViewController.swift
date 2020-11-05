import UIKit
import BagOfTricks


public class SimpleTabViewController: UIViewController {
  public var animated = true
  private let viewControllers: [UIViewController]
  private let usesLayoutGuide: Bool
  private var selectedConstraints: [NSLayoutConstraint] = []

  
  public var selectedIndex: Int {
    willSet {
      unselectAllControllers()
    }
    didSet {
      selectController(viewControllers[selectedIndex])
    }
  }
  
  
  public init(children: [UIViewController], usesLayoutGuide: Bool = true) {
    precondition(children.isNotEmpty)
    viewControllers = children
    selectedIndex = 0
    self.usesLayoutGuide = usesLayoutGuide
    super.init(nibName: nil, bundle: nil)
  }
  
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("unimplemented")
  }
}



public extension SimpleTabViewController {
  var numberOfTabs: Int {
    return viewControllers.count
  }
}



private extension SimpleTabViewController {
  func unselectAllControllers() {
    NSLayoutConstraint.deactivate(selectedConstraints)
    selectedConstraints = []
    children.forEach { viewController in
      extract(viewController)
    }
  }
  
  
  func selectController(_ vc: UIViewController) {
    selectedConstraints.append(contentsOf: embedFullFrame(vc, usesLayoutGuide: usesLayoutGuide))
  }
}
