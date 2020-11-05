import XCTest
import BoxOfToys



private class MyTabView: SimpleTabViewController {
  public init(someController: UIViewController) {
    super.init(children: [
      someController,
      UIViewController(),
      UIViewController(),
    ], usesLayoutGuide: false)
  }
  
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



class SubclassableTests: XCTestCase {
  func testCompiles() {
    //Not much to test other than that we get to here.
    XCTAssertNotNil(MyTabView(someController: UIViewController()))
  }
}
