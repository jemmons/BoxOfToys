import UIKit



public class AdaptivePopoverDelegate: NSObject, UIPopoverPresentationControllerDelegate {
  public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
}



private let adaptivePopoverDelegate = AdaptivePopoverDelegate()



public func popoverify(_ vc: UIViewController, source: UIView) {
  vc.preferredContentSize = vc.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
  vc.modalPresentationStyle = .popover
  vc.popoverPresentationController?.delegate = adaptivePopoverDelegate
  vc.popoverPresentationController?.sourceRect = source.bounds
  vc.popoverPresentationController?.sourceView = source
}
