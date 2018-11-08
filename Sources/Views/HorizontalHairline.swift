import UIKit



@IBDesignable
public class HorizontalHairline: UIView {
  @IBInspectable private var color: UIColor = UIColor.black {
    didSet {
      setNeedsDisplay()
    }
  }
  
  
  public override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 1)
  }
  
  
  public override func draw(_ rect: CGRect) {
    Helper.singlePixelLine(at: 0, in: bounds, color: color, topBias: false)
  }
}



private enum Helper {
  static func singlePixelLine(at y: CGFloat, in rect: CGRect, color: UIColor, topBias: Bool = true) {
    let offset = pixelUnit / 2.0
    let adjustedY = round(from: y - offset, fraction: pixelUnit, down: topBias) + offset
    let line = makeLine(at: adjustedY, in: rect)
    strokePath(line, width: pixelUnit, color: color)
  }
  
  
  private static var pixelUnit: CGFloat {
    return 1.0 / UIScreen.main.scale
  }
  
  
  private static func round(from: CGFloat, fraction: CGFloat, down: Bool = true) -> CGFloat {
    let expanded = from / fraction
    let rounded = (down ? floor : ceil)(expanded)
    return rounded * fraction
  }
  
  
  private static func makeLine(at y: CGFloat, in rect: CGRect) -> UIBezierPath {
    precondition((rect.minY...rect.maxY).contains(y))
    let line = UIBezierPath()
    line.move(to: CGPoint(x: rect.minX, y: y))
    line.addLine(to: CGPoint(x: rect.maxX, y: y))
    return line
  }
  
  
  private static func strokePath(_ path: UIBezierPath, width: CGFloat, color: UIColor) {
    path.lineWidth = width
    color.setStroke()
    path.stroke()
  }
}
