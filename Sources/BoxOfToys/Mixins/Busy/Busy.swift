import UIKit
import BagOfTricks


/**
 A mixin adding "loading screen" functionality to controllers that conform to it. No implementation is needed (implementations are added via extension)
 **/
public protocol Busy: class {
  /**
   Reflect whether the busy view of a controller is currently being displayed. Setting this will cause the busy view to be added or removed from the conforming receiver.
   
   This busy view will be presented (or dismissed) with a simple cross-fade animation. The presentation (or dismissal) will be queued to run on the next iteration of the run loop.
   */
  var isBusy: Bool {get set}
  
  
  /// The opposite of `isBusy`.
  var isNotBusy: Bool {get}
}



public extension Busy where Self: UIViewController {
  var isBusy: Bool {
    get {
      return findBusyController() != nil
    }
    set {
      switch newValue {
      case true:
        //This runs `addBusy` on the next iteration of the runloop. This is necessary to avoid situations (mostly with table views) where items get added to the root view's heirarchy after the busy view is presented, and thus appear on top of the busy animation.
        //This will cause the display of the busy animation to be delayed by a tick, but this should be unnoticable in most situations. One place where it will be noticiable is in when setting busy in `viewDidLoad` on a view that is being presented with a push. Instead of presenting with the busy animation visible, it will first present, then transition to busy.
        DispatchQueue.main.asyncAfter(deadline: .now()) {
          self.addBusy()
        }
      case false:
        //Unlike `addBusy`, there's no display reason to dismiss the busy view on the next runloop. We only do it so that if `isBusy = true` and `isBusy = false` get called in the same runloop, `removeBusy()` still gets called *after* `addBusy()`.
        DispatchQueue.main.asyncAfter(deadline: .now()) {
          self.removeBusy()
        }
      }
    }
  }
  
  
  var isNotBusy: Bool {
    return ❗️isBusy
  }
  
  
  private func findBusyController() -> BlurBusyViewController? {
    return children.first { $0 is BlurBusyViewController } as? BlurBusyViewController
  }
  
  
  private func addBusy() {
    guard isNotBusy else {
      return
    }
    //Normally user interaction wouldn't matter becasue we've put a view on top of all interface elements of the view. But in the case of a scroll view, the invisible gesture recognizer that let's scrolling happen is still in place. This could let a user, for example, trigger a pull-to-refrech behind the busy view.
    //This is disabled by turning user interaction off. We then turn it on again in `removeBusy()`.
    view.isUserInteractionEnabled = false
    let busyController = BlurBusyViewController()
    let constraints = embedFullFrame(busyController)
    busyController.parentConstraints = constraints
  }
  
  
  private func removeBusy() {
    guard let child = findBusyController() else {
      return
    }
    //see the note about user interaction in `addBusy()`.
    view.isUserInteractionEnabled = true
    NSLayoutConstraint.deactivate(child.parentConstraints)
    extract(child)
  }
}
