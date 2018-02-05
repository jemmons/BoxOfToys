import XCTest



class UtilitiesTests: XCTestCase {
  func testRootViewControllerIsReplaced() {
    let oldRoot = UIViewController()
    UIApplication.shared.keyWindow?.rootViewController = oldRoot
    XCTAssertEqual(UIApplication.shared.keyWindow?.rootViewController, oldRoot)
    
    Util.withNewRootController { root in
      XCTAssertNotEqual(oldRoot, root)
    }
    
    XCTAssertEqual(UIApplication.shared.keyWindow?.rootViewController, oldRoot)
  }
}



