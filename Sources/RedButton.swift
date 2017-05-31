import UIKit


public class RedButton: UIButton {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }
  
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }
  
  
  private func sharedInit() {
    backgroundColor = .red
  }
}
