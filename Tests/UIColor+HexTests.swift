import XCTest
import BoxOfToys



class UIColorHexTests: XCTestCase {
  func testRed() {
    XCTAssertEqual(UIColor(hex: 0xFF0000), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
  }

  func testGreen() {
    XCTAssertEqual(UIColor(hex: 0x00FF00), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
  }
  
  func testBlue() {
    XCTAssertEqual(UIColor(hex: 0x0000FF), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
  }
  
  func testMinuscule() {
    XCTAssertEqual(UIColor(hex: 0xffaa00), UIColor(red: 1, green: 170.0/255.0, blue: 0, alpha: 1))
  }
}
