//
//  BaseViewController.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 2/7/21.
//

import UIKit

class BaseViewController: UIViewController {
  var isNavigationBarAnimated: Bool { true }
  var isNavigationBarHidden: Bool { false }

  override var preferredStatusBarStyle: UIStatusBarStyle { statusBarStyle }
  var statusBarStyle: UIStatusBarStyle = .default {
    didSet {
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: isNavigationBarAnimated)
  }
}
