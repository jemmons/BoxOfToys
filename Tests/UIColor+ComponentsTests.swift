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


  func testHexRoundTrip() {
    XCTAssertEqual(UIColor(hex: 0xC0FF1E).hex, 0xC0FF1E)
    XCTAssertEqual(UIColor(hex: 0x89dead).hex, 0x89dead)
    XCTAssertEqual(UIColor(hex: 0xbadf00).hex, 0xbadf00)
  }
  
  
  func testRBGRed() {
    let (r, g, b, a) = UIColor.red.rgbaComponents()!
    XCTAssertEqual(r, 1.0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 1.0)
  }
  
  
  func testRBGGreen() {
    let (r, g, b, a) = UIColor.green.rgbaComponents()!
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 1.0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 1.0)
  }
  
  
  func testRBGBlue() {
    let (r, g, b, a) = UIColor.blue.rgbaComponents()!
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 1.0)
    XCTAssertEqual(a, 1.0)
  }
  
  
  func testRGBRoundTrip() {
    let red: CGFloat = 0.4
    let green: CGFloat = 0.3
    let blue: CGFloat = 0.2
    let alpha: CGFloat = 0.1
    
    let (r,g,b,a) = UIColor(red: red, green: green, blue: blue, alpha: alpha).rgbaComponents()!
    XCTAssertEqual(red, r)
    XCTAssertEqual(green, g)
    XCTAssertEqual(blue, b)
    XCTAssertEqual(alpha, a)
  }
  
  
  func testHSBRoundTrip() {
    let hue: CGFloat = 0.4
    let saturation: CGFloat = 0.3
    let brightness: CGFloat = 0.2
    let alpha: CGFloat = 0.1
    
    let (h,s,b,a) = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha).hsbaComponents()!
    XCTAssertEqual(hue, h, accuracy: 1e-12)
    XCTAssertEqual(saturation, s, accuracy: 1e-12)
    XCTAssertEqual(brightness, b, accuracy: 1e-12)
    XCTAssertEqual(alpha, a, accuracy: 1e-12)
  }
}
