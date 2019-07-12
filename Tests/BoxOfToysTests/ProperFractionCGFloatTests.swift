import UIKit
import XCTest
import BagOfTricks
import BoxOfToys



class ProperFractionCGFloatTests: XCTestCase {
  func testFloatValue() {
    let value: Double = 1/3
    XCTAssertEqual(CGFloat(value), try! ProperFraction(value).cgFloat)
  }

  
  func testFloatInit() {
    let value: CGFloat = CGFloat(1/3)
    XCTAssertNotNil(try? ProperFraction(value))
    _ = ProperFraction(clipping: value)
  }
}
