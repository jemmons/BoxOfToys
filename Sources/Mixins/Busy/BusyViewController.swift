import UIKit



open class BusyViewController: UIViewController {
  public var parentConstraints: [NSLayoutConstraint] = []
  
  
  public required init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Do not load from NIB.")
  }
}
