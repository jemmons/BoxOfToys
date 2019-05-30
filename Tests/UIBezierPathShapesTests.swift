import UIKit
import XCTest
import BoxOfToys
import BagOfTricks



class UIBezierPathShapesTests: XCTestCase {
  func testCircle() {
    with(CGRect(x: 50, y: 50, width: 100, height: 200)) { rect in
      let subject = UIBezierPath.makeCircle(centeredIn: rect)
      XCTAssertEqual(CGPoint(x: 50, y: 100), subject.bounds.origin)
      XCTAssertEqual(CGSize(width: 100, height: 100), subject.bounds.size)
    }

    with(CGRect(x: 50, y: 50, width: 200, height: 100)) { rect in
      let subject = UIBezierPath.makeCircle(centeredIn: rect)
      XCTAssertEqual(CGPoint(x: 100, y: 50), subject.bounds.origin)
      XCTAssertEqual(CGSize(width: 100, height: 100), subject.bounds.size)
    }

    with(CGRect(x: 50, y: 50, width: 100, height: 100)) { rect in
      let subject = UIBezierPath.makeCircle(centeredIn: rect)
      XCTAssertEqual(CGPoint(x: 50, y: 50), subject.bounds.origin)
      XCTAssertEqual(CGSize(width: 100, height: 100), subject.bounds.size)
    }
    
    with(UIBezierPath.makeCircle(centeredIn: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))) { subject in
      let t = 1
      let samples: [[Int]] = [
        [0,0,0,0,0,0,0,0,0,0,t,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,t,t,t,t,t,t,t,t,t,0,0,0,0,0],
        [0,0,0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,0,0,0],
        [0,0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0,0],
        [0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0],
        [0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t],
        [0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0],
        [0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0],
        [0,0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,0,0],
        [0,0,0,0,t,t,t,t,t,t,t,t,t,t,t,t,t,0,0,0],
        [0,0,0,0,0,0,t,t,t,t,t,t,t,t,t,0,0,0,0,0],
      ]
      let xDimension = samples[0].count
      let yDimension = samples.count
      let everySample = expectation(description: "waiting to hit all samples")
      everySample.expectedFulfillmentCount = xDimension * yDimension

      product((0..<xDimension), (0..<yDimension)).forEach { x, y in
        let point = CGPoint(x: x * (100/xDimension), y: y * (100/yDimension))
        let expected = samples[y][x]
        XCTAssertEqual(subject.contains(point) ? 1 : 0, expected)
        everySample.fulfill()
      }
      wait(for: [everySample], timeout: 0)
    }
  }
}
