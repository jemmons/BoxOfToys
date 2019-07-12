import UIKit
import BagOfTricks



public enum Alert {}



public extension Alert {
  static func present(title: String?, message: String? = nil) {
    let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    present(title: title, message: message, actions: [ok])
  }
  
  
  static func present(title: String?, message: String? = nil, actions: [UIAlertAction]) {
    guard
      let presenter = UIApplication.shared.findTopPresenter(),
      ❗️(presenter is UIAlertController) else {
        return
    }
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    actions.forEach { alert.addAction($0) }
    presenter.present(alert, animated: true, completion: nil)
  }
}
