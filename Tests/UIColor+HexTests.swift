import XCTest
import BoxOfToys



class UIColorHexTests: XCTestCase {
  func testFromHexRed() {
    XCTAssertEqual(UIColor(hex: 0xFF0000), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
  }

  func testFromHexGreen() {
    XCTAssertEqual(UIColor(hex: 0x00FF00), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
  }
  
  func testFromHexBlue() {
    XCTAssertEqual(UIColor(hex: 0x0000FF), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
  }
  
  func testMinusculeHex() {
    XCTAssertEqual(UIColor(hex: 0xffaa00), UIColor(red: 1, green: 170.0/255.0, blue: 0, alpha: 1))
  }
  
  
  func testToHexRed() {
    XCTAssertEqual(UIColor(red: 170/255, green: 0, blue: 0, alpha: 1).hex, 0xaa0000)
  }
  

  func testToHexGreen() {
    XCTAssertEqual(UIColor(red: 0, green: 170/255, blue: 0, alpha: 1).hex, 0x00aa00)
  }


  func testToHexBlue() {
    XCTAssertEqual(UIColor(red: 0, green: 0, blue: 170/255, alpha: 1).hex, 0x0000aa)
  }


  func testRoundTrip() {
    XCTAssertEqual(UIColor(hex: 0xabc123).hex, 0xabc123)
    XCTAssertEqual(UIColor(hex: 0x0dead0).hex, 0x0dead0)
    XCTAssertEqual(UIColor(hex: 0xbadf00).hex, 0xbadf00)
  }
}
