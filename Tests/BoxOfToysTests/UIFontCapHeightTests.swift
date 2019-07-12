import UIKit
import XCTest
import BoxOfToys



class UIFontCapHeightTests: XCTestCase {
  let height: CGFloat = 32
  let expectedCapHeight: CGFloat = 45.41649341649342
  
  
  func testSystemCapHeight() {
    let subject = UIFont.systemFont(capHeight: height)
    XCTAssertGreaterThan(subject.pointSize, height)
    XCTAssertEqual(subject.pointSize, expectedCapHeight, accuracy: 0.001)
  }
  

  func testBoldSystemCapHeight() {
    let subject = UIFont.boldSystemFont(capHeight: height)
    XCTAssertGreaterThan(subject.pointSize, height)
    XCTAssertEqual(subject.pointSize, expectedCapHeight, accuracy: 0.001)
  }

  
  
  func testBoldItalicSystemCapHeight() {
    let subject = UIFont.boldItalicSystemFont(capHeight: height)
    XCTAssertGreaterThan(subject.pointSize, height)
    XCTAssertEqual(subject.pointSize, expectedCapHeight, accuracy: 0.001)
  }

  
  func testBlackItalicSystemCapHeight() {
    let subject = UIFont.blackItalicSystemFont(capHeight: height)
    //45.41649341649342
    XCTAssertGreaterThan(subject.pointSize, height)
    XCTAssertEqual(subject.pointSize, expectedCapHeight, accuracy: 0.001)
  }
}
