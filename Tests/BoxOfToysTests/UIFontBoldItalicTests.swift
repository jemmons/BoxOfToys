import UIKit
import XCTest
import BoxOfToys



class UIFontBoldItalicTests: XCTestCase {
  func testBoldItalic() {
    let subject = UIFont.boldItalicSystemFont(ofSize: 32)
    XCTAssert(subject.fontName.hasSuffix("SemiboldItalic"))
  }


  func testBlackItalic() {
    let subject = UIFont.blackItalicSystemFont(ofSize: 32)
    XCTAssert(subject.fontName.hasSuffix("BlackItalic"))
  }
}
