import UIKit
import BagOfTricks


public class BlurBusyViewController: BusyViewController {
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    with(UIVisualEffectView(effect: UIBlurEffect(style: .light))) {
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
      NSLayoutConstraint.activate([
        $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        $0.topAnchor.constraint(equalTo: view.topAnchor),
        $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    with(UIActivityIndicatorView(style: .whiteLarge)) {
      $0.color = .black
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
      NSLayoutConstraint.activate([
        $0.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        $0.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
      $0.startAnimating()
    }
  }
}
