import UIKit



public extension UIView {
  func shake(distance: CGFloat = 30, duration: TimeInterval = 0.5, damping: CGFloat = 0.2) {
    let base = CGAffineTransform.identity
    let offset = base.translatedBy(x: distance, y: 0)
    transform = offset
    UIView.animate(withDuration: duration, delay: 0,
                   usingSpringWithDamping: damping,
                   initialSpringVelocity: 0,
                   options: [],
                   animations: { self.transform = base },
                   completion: nil)
  }
}
