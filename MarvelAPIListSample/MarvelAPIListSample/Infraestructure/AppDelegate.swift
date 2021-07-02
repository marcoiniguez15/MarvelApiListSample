//
//  AppDelegate.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 2/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    window = UIWindow.init(frame: UIScreen.main.bounds)
    let initialViewController = storyboard.instantiateViewController(withIdentifier: "VC")
    window?.rootViewController = initialViewController
    window?.makeKeyAndVisible()
    return true
  }


}

