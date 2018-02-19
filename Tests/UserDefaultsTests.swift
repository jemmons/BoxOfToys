import XCTest
import BoxOfToys





class UserDefaultsTests: XCTestCase {
  func testColors() {
    enum Key {
      static let red = "redKey"
      static let purple = "purpleKey"
      static let white = "whiteKey"
    }
    let red = UIColor.red
    let purple = UIColor.purple
    let white = UIColor.white

    blankDefaultsWhile {
      XCTAssertNil(UserDefaults.standard.color(forKey: Key.red))
      XCTAssertNil(UserDefaults.standard.color(forKey: Key.purple))
      XCTAssertNil(UserDefaults.standard.color(forKey: Key.white))

      UserDefaults.standard.set(red, forKey: Key.red)
      UserDefaults.standard.set(purple, forKey: Key.purple)
      UserDefaults.standard.set(white, forKey: Key.white)

      XCTAssertEqual(red, UserDefaults.standard.color(forKey: Key.red))
      XCTAssertEqual(purple, UserDefaults.standard.color(forKey: Key.purple))
      XCTAssertEqual(white, UserDefaults.standard.color(forKey: Key.white))
    }
  }
}



private extension UserDefaultsTests {
  func blankDefaultsWhile(handler:()->Void){
    guard let name = Bundle.main.bundleIdentifier else {
      fatalError("Couldn't find bundle ID.")
    }
    let old = UserDefaults.standard.persistentDomain(forName: name)
    defer {
      UserDefaults.standard.setPersistentDomain( old ?? [:],
                                forName: name)
    }
    
    UserDefaults.standard.removePersistentDomain(forName: name)
    handler()
  }
}

