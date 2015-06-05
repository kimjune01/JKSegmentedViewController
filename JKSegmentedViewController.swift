
import UIKit

///A container view controller using Segmented Control.
class JKSegmentedViewController: UIViewController {

  var segmentedControl =  UISegmentedControl()
  var viewControllers = [UIViewController]()
  private var containerView = UIView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assert(viewControllers.count > 1, "Add viewControllers first!!!")
    addSegmentedControl()
    addViewControllers()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    segmentedControl.selectedSegmentIndex = 0
    swapToVCAt(0)
  }
  
  func addSegmentedControl() {
    addSegments()
    segmentedControl.frame = CGRect(
      x: 0,
      y: statusBarHeight(),
      width: self.view.frame.width,
      height: segmentedControlHeight())
    segmentedControl.addTarget(self, action: "segmentedControlTapped:", forControlEvents: .ValueChanged)
    view.addSubview(segmentedControl)
  }
  
  func addSegments() {
    removeSegments()
    for var i = 0 ; i < self.viewControllers.count; i++ {
      let eachVC = self.viewControllers[i]
      assert(eachVC.title != nil, "Each view controller needs a title!!")
      segmentedControl.insertSegmentWithTitle(eachVC.title, atIndex: i, animated: true)
    }
  }
  
  func removeSegments() {
    for var i = 0; i < min(self.segmentedControl.numberOfSegments - 1, 0); i++ {
      self.segmentedControl .removeSegmentAtIndex(i, animated: true)
    }
  }
  
  func addViewControllers() {
    containerView.frame = CGRect(
      x: 0,
      y: segmentedControl.frame.height + statusBarHeight(),
      width: view.frame.width,
      height: view.frame.height - segmentedControl.frame.height)
    view.addSubview(containerView)
    for eachVC in viewControllers {
      add(eachVC)
    }
  }
  
  func add(childVC:UIViewController) {
    addChildViewController(childVC)
    containerView.addSubview(childVC.view)
    childVC.didMoveToParentViewController(self)
  }
  
  func segmentedControlTapped(control:UISegmentedControl) {
    swapToVCAt(control.selectedSegmentIndex)
  }
  
  func swapToVCAt(index:Int){
    for var i = 0 ; i < self.viewControllers.count ; i++ {
      if index == i {
        viewControllers[i].view.hidden = false;
      } else {
        viewControllers[i].view.hidden = true;
      }
    }
  }
  
  func statusBarHeight() -> CGFloat {
    if UIApplication.sharedApplication().statusBarHidden {
      return 0;
    } else {
      return 20.0;
    }
  }
  
  func segmentedControlHeight() -> CGFloat {
    return 28;
  }

}
