import UIKit
import XCTest
import BoxOfToys



class UIViewNegativesTests: XCTestCase {
  func testVisible() {
    let view = UIView()
    XCTAssertFalse(view.isHidden)
    XCTAssertTrue(view.isVisible)
  }
  
  
  func testHidden() {
    let view = UIView()
    view.isHidden = true
    XCTAssertTrue(view.isHidden)
    XCTAssertFalse(view.isVisible)
  }
  
  
  func testMutableVisibility() {
    let view = UIView()
    XCTAssertFalse(view.isHidden)
    XCTAssertTrue(view.isVisible)
    
    view.isVisible = false
    XCTAssertTrue(view.isHidden)
    XCTAssertFalse(view.isVisible)

    view.isVisible = true
    XCTAssertFalse(view.isHidden)
    XCTAssertTrue(view.isVisible)
  }
}
