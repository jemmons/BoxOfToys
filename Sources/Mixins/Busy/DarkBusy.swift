import UIKit



public protocol DarkBusy: AbstractBusy {}



public extension DarkBusy where Self: UIViewController {
  typealias ViewController = DarkBlurBusyViewController
}

