//
//  CharactersListPresenter.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

protocol CharactersListPresentationLogic {
  func presentResponse(_ response: CharactersListModel.Response)
}

final class CharactersListPresenter {
  private weak var viewController: CharactersListDisplayLogic?
  
  init(viewController: CharactersListDisplayLogic?) {
    self.viewController = viewController
  }
}


// MARK: - CharactersListPresentationLogic
extension CharactersListPresenter: CharactersListPresentationLogic {
  
  func presentResponse(_ response: CharactersListModel.Response) {
    
    switch response {
      
    case let .prepareCharactersList(list):
      self.prepareCharactersList(data: list)
      
    case let .showError(model):
      self.viewController?.displayViewModel(.showError(model: model))
    }
  }
}


// MARK: - Private Zone
private extension CharactersListPresenter {
  
  func prepareCharactersList(data: [ResultList]) {
    let title = "Characters List"
    var items: [CharactersListModel.CellModel] = []
    for character in data {
      var imageName: String?
      if let thumbnail = character.thumbnail, let path = thumbnail.path, let exten = thumbnail.exten {
        imageName = path + "." + exten
      }
      if let name = character.name {
        let item = CharactersListModel.CellModel(name: name, imageName: imageName)
        items.append(item)
      }
    }
    self.viewController?.displayViewModel(.prepareCharactersList(
                                            viewModelData: CharactersListModel.ViewDataSource(title: title, items: items)))
  }
}
