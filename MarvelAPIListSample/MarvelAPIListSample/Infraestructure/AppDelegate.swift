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
    setupRootViewController()
    return true
  }
  
  func setupRootViewController() {
    let vc = CharactersListViewController(factory: AppInjector.CharactersListInjector(), mainView: CharactersListView.init(), dataSource: CharactersListModel.DataSource())
    let navigationController = UINavigationController(rootViewController: vc)
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = navigationController
  }

}

