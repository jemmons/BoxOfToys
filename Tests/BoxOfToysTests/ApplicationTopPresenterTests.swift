import XCTest
import BoxOfToys



class AppliucationTopPresenterTests: XCTestCase {
  #warning("These tests require a test host application to run in. That’s not currently possible with SwiftPM.")
//  func testRoot() {
//    Util.withNewRootController { root in
//      XCTAssertEqual(root, UIApplication.shared.findTopPresenter())
//    }
//  }
//
//
//  func testPresented() {
//    let expectedPresentation = expectation(description: "Waiting for presentation")
//
//    Util.withNewRootController { root in
//      let newTop = UIViewController()
//      root.present(newTop, animated: false) {
//        XCTAssertEqual(newTop, UIApplication.shared.findTopPresenter())
//        expectedPresentation.fulfill()
//      }
//      wait(for: [expectedPresentation], timeout: 5)
//    }
//  }
//
//
//  func testNestedPresentationFromNav() {
//    let expectedPresentation = expectation(description: "Waiting for presentation")
//    Util.withNewRootController { root in
//      let navRoot = UIViewController()
//      let nav = UINavigationController(rootViewController: navRoot)
//      let newTop = UIViewController()
//      XCTAssertEqual(UIApplication.shared.findTopPresenter(), root)
//      root.present(nav, animated: false) {
//        XCTAssertEqual(nav, UIApplication.shared.findTopPresenter())
//        navRoot.present(newTop, animated: false) {
//          XCTAssertEqual(newTop, UIApplication.shared.findTopPresenter())
//          expectedPresentation.fulfill()
//        }
//      }
//      wait(for: [expectedPresentation], timeout: 5)
//    }
//  }
}

