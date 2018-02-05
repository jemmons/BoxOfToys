import XCTest
import BoxOfToys



class AppliucationTopPresenterTests: XCTestCase {
  
  func testRoot() {
    Util.withNewRootController { root in
      XCTAssertEqual(root, UIApplication.shared.findTopPresenter())
    }
  }
  
  
  func testPresented() {
    Util.withNewRootController { root in
      let newTop = UIViewController()
      root.present(newTop, animated: false) {
        XCTAssertEqual(newTop, UIApplication.shared.findTopPresenter())
      }
    }
  }
  
  
  func testNestedPresentationFromNav() {
    Util.withNewRootController { root in
      let nav = UINavigationController()
      let rootNav = UIViewController()
      let newTop = UIViewController()
      root.present(nav, animated: false) {
        XCTAssertEqual(nav, UIApplication.shared.findTopPresenter())
        rootNav.present(newTop, animated: false) {
          XCTAssertEqual(newTop, UIApplication.shared.findTopPresenter())
        }
      }
    }
  }
}

