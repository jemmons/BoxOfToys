import UIKit
import XCTest
import BoxOfToys



class UIFontBoldItalicTests: XCTestCase {
  func testBoldItalic() {
    let subject = UIFont.boldItalicSystemFont(ofSize: 32)
    XCTAssertEqual(".SFUIDisplay-SemiboldItalic", subject.fontName)
  }


  func testBlackItalic() {
    let subject = UIFont.blackItalicSystemFont(ofSize: 32)
    XCTAssertEqual(".SFUIDisplay-BlackItalic", subject.fontName)
  }
}
