import UIKit
import BagOfTricks


public class SimpleTabViewController: UIViewController {
  public var viewControllers: [UIViewController] = [] {
    didSet {
      guard viewControllers.isNotEmpty else {
        selectedIndex = nil
        return
      }
      selectedIndex = 0
    }
  }
  
  
  public var selectedIndex: Int? {
    willSet {
      removeControllers()
    }
    didSet {
      addSelectedController()
    }
  }
  
  
  fileprivate var selectedConstraints: [NSLayoutConstraint] = []
}



public extension SimpleTabViewController {
  public var numberOfTabs: Int {
    return viewControllers.count
  }
}



private extension SimpleTabViewController {
  func removeControllers() {
    childViewControllers.forEach {
      remove($0, constraints: selectedConstraints)
      selectedConstraints = []
    }
  }
  
  
  func addSelectedController() {
    guard let someIndex = selectedIndex else {
      return
    }
    selectedConstraints = embedFullFrame(viewControllers[someIndex])
  }
}
