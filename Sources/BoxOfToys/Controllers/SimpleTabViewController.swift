import UIKit
import BagOfTricks


public class SimpleTabViewController: UIViewController {
  private let viewControllers: [UIViewController]
  private let usesLayoutGuide: Bool
  private var selectedConstraints: [NSLayoutConstraint] = []

  
  public var selectedIndex: Int {
    willSet {
      removeControllers()
    }
    didSet {
      addSelectedController()
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
  public var numberOfTabs: Int {
    return viewControllers.count
  }
}



private extension SimpleTabViewController {
  func removeControllers() {
    NSLayoutConstraint.deactivate(selectedConstraints)
    selectedConstraints = []
    children.forEach { viewController in
      extract(viewController)
    }
  }
  
  
  func addSelectedController() {
    selectedConstraints.append(contentsOf: embedFullFrame(viewControllers[selectedIndex], usesLayoutGuide: usesLayoutGuide))
  }
}
