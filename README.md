JKSegmentedViewController
=================

The quickest way to use segmented control with child view controllers, written in Swift.

![demo](http://i.imgur.com/ZDAq2bZ.gifv)

### Usage

Copy and paste JKSegmentedViewController into your project/workspace.

### Code
``` swift

override func viewDidLoad() {
super.viewDidLoad()

let dayTimeVC = UIViewController()
dayTimeVC.title = "DayTime"
dayTimeVC.view.backgroundColor = UIColor.lightGrayColor()

let nightTimeVC = UIViewController()
nightTimeVC.view.backgroundColor = UIColor.darkGrayColor()
nightTimeVC.title = "NightTime"

segmentedVC.viewControllers = [dayTimeVC, nightTimeVC]

addChildViewController(segmentedVC)
view.addSubview(segmentedVC.view)
segmentedVC.didMoveToParentViewController(self)

}
```

### Customize
Use any custom UISegmentedControl before viewDidLoad or any other container view.

### Author

June Kim, kimjune01@gmail.com

### License

JKPageViewController is available under the MIT license. See the LICENSE file for more info.

