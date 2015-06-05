//
//  ViewController.swift
//  JKPageControlSample
//
//  Created by Camvy Films on 2015-06-04.
//  Copyright (c) 2015 June. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let segmentedVC = JKSegmentedViewController()
  
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
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

