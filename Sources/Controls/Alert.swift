import UIKit
import BagOfTricks



public enum Alert {}



public extension Alert {
  static func present(title: String?, message: String? = nil) {
    guard
      let presenter = UIApplication.shared.findTopPresenter(),
      ❗️(presenter is UIAlertController) else {
        return
    }
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    
    presenter.present(alert, animated: true, completion: nil)
  }
}
