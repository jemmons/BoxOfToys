import UIKit
import BagOfTricks


public class StatefulTableViewController: UIViewController {
  fileprivate weak var tabController: SimpleTabViewController!
  public weak var tableView: UITableView!
}



public extension StatefulTableViewController {
  enum State: Int {
    case busy = 0, table, empty, error
  }
  
  
  var state: State {
    get {
      guard let index = tabController.selectedIndex else {
        fatalError("Table has no selected index.")
      }
      guard let state = State(rawValue: index) else {
        fatalError("Selected index out of range of table tabs.")
      }
      return state
    }
    set {
      let newIndex = newValue.rawValue
      assert(newIndex >= 0 && newIndex < tabController.numberOfTabs)
      tabController.selectedIndex = newValue.rawValue
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabController = given(SimpleTabViewController()) {
      embedFullFrame($0)
    }
    
    with(UITableViewController(style: .plain)) {
      tabController.viewControllers = [
        UIViewController(nibName: "LoadingTableView", bundle: nil),
        $0,
        UIViewController(nibName: "EmptyTableView", bundle: nil),
        UIViewController(nibName: "ErrorTableView", bundle: nil),
      ]
      tableView = $0.tableView
    }
  }
}
