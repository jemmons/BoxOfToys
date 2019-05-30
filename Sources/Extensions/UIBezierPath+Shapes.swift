import UIKit



public extension UIBezierPath {
  static func makeCircle(centeredIn rect: CGRect) -> UIBezierPath {
    return UIBezierPath(
      arcCenter: CGPoint(x: rect.midX, y: rect.midY),
      radius: min(rect.width, rect.height)/2.0,
      startAngle: 0,
      endAngle: 2*CGFloat.pi,
      clockwise: true)
  }
}

