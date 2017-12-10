import UIKit
import BagOfTricks


public class StatefulTableViewController: UIViewController {
  private weak var tabController: SimpleTabViewController!
  public weak var tableView: UITableView!
}



public extension StatefulTableViewController {
  enum State: Int {
    case busy = 0, table, empty, error
  }
  
  
  var state: State {
    get {
      guard let state = State(rawValue: tabController.selectedIndex) else {
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
    let tableViewController = UITableViewController(style: .plain)
    let tabViewControllers = [
      UIViewController(nibName: "LoadingTableView", bundle: nil),
      tableViewController,
      UIViewController(nibName: "EmptyTableView", bundle: nil),
      UIViewController(nibName: "ErrorTableView", bundle: nil),
      ]
    
    tabController = given(SimpleTabViewController(children: tabViewControllers)) {
      embedFullFrame($0)
    }
    
    tableView = tableViewController.tableView
  }
}
