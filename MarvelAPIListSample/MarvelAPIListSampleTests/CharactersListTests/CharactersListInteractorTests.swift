//
//  CharactersListInteractorTests.swift
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


final class CharactersListInteractorTests: XCTestCase {
  
  private var presenter: CharactersListPresenterSpy!
  private var interactor: CharactersListInteractor!
  private var apiService: ApiServiceSpy!

  override func setUp() {
    interactor = CharactersListInteractor(factory: self, viewController: nil, dataSource: CharactersListModel.DataSource())
  }
  
  override func tearDown() {
    presenter = nil
    interactor = nil
    apiService =  nil
  }
}


// MARK: - Tests
extension CharactersListInteractorTests {
  
  func testItemPressed() {
    presenter.detailExpectation = expectation(description: "detailExpectation")
    presenter.listExpectation = expectation(description: "listExpectation")
    let testIndex = 0
    let testId = 1011334
    interactor.doRequest(.prepareCharactersList(page: 0))
    wait(for: [presenter.listExpectation], timeout: 0.1)
    interactor.doRequest(.itemPressed(index: testIndex))
    wait(for: [presenter.detailExpectation], timeout: 0.1)
    XCTAssertEqual(testId, presenter.passedId)
  }
  
  func testShowList() {
    presenter.listExpectation = expectation(description: "listExpectation")
    let testPage = 0
    interactor.doRequest(.prepareCharactersList(page: testPage))
    wait(for: [presenter.listExpectation], timeout: 0.1)
    XCTAssertEqual(testPage, apiService.passedPage)
  }
  
  func testShowError() {
    presenter.errorExpectation = expectation(description: "errorExpectation")
    presenter.listExpectation = expectation(description: "listExpectation")
    let testPage = 1
    interactor.doRequest(.prepareCharactersList(page: testPage))
    wait(for: [presenter.listExpectation], timeout: 0.1)
    let testErrorModel = ErrorHelper.createGenericError()
    wait(for: [presenter.errorExpectation], timeout: 0.1)
    XCTAssertEqual(testPage, apiService.passedPage)
    XCTAssertEqual(testErrorModel.message, presenter.passedErrorModel.message)
  }
  
}


// MARK: - CharactersListFactorable
extension CharactersListInteractorTests: CharactersListFactorable {
  
  func makePresenter(viewController: CharactersListDisplayLogic?) -> CharactersListPresentationLogic {
    presenter = CharactersListPresenterSpy()
    return presenter
  }
  

  
  func makeApiService() -> APIClientProtocol {
    apiService = ApiServiceSpy()
    return apiService
  }
}


// MARK: - Spy Classes Setup
private extension CharactersListInteractorTests {
  
  final class CharactersListPresenterSpy: CharactersListPresentationLogic {
    var listExpectation: XCTestExpectation!
    var detailExpectation: XCTestExpectation!
    var errorExpectation: XCTestExpectation!
    var passedCharacterList: [ResultList]!
    var passedId: Int!
    var passedErrorModel: ErrorModel!

    func presentResponse(_ response: CharactersListModel.Response) {
      
      switch response {
      case let .prepareCharactersList(data):
        passedCharacterList = data
        listExpectation.fulfill()

      case let .showDetail(id):
        passedId = id
        detailExpectation.fulfill()
        
      case let .showError(model):
        passedErrorModel = model
        errorExpectation.fulfill()
      }
    }
  }
  
  final class ApiServiceSpy: APIClientProtocol {
    var passedPage: Int!
    var passedId: Int!
    
    func getCharactersList(page: Int, completion: @escaping (Result<CharactersList, NetworkError>, Int?) -> Void) {
      passedPage = page
      if page == 1 {
        let error = NetworkError.parameterEncodingFailed(reason: .missingURL)
        completion(.failure(error), 500)
      }
      if let data = FileManager.default.contents(atPath: R.file.charactersListJson()!.path) {
        let decoder = JSONDecoder()
        do {
          let model = try decoder.decode(CharactersList.self, from: data)
          completion(.success(model), 200)
        } catch {
          fatalError(error.localizedDescription)
        }
      }
     
    }
    
    func getCharacterDetail(id: Int, completion: @escaping (Result<CharactersList, NetworkError>, Int?) -> Void) {
      
    }
  }
}

