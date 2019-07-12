import UIKit



public protocol Busy: AbstractBusy {}



public extension Busy where Self: UIViewController {
  typealias ViewController = BlurBusyViewController
}
