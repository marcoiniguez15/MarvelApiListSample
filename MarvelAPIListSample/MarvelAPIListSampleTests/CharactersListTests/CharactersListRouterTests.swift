//
//  CharactersListRouterTests.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import XCTest
@testable import MarvelAPIListSample


final class CharactersListRouterTests: XCTestCase {
  
  private var router: CharactersListRouter!
  private var viewController: CharactersListViewControllerSpy!

  override func setUp() {
    viewController = CharactersListViewControllerSpy()
    router = CharactersListRouter(viewController: viewController)
  }

  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension CharactersListRouterTests {

}


// MARK: - Spy Classes Setup
private extension CharactersListRouterTests {

  final class CharactersListViewControllerSpy: UIViewController {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      dismissExpectation.fulfill()
    }
  }
}
