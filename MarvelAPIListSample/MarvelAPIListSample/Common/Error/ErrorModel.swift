//
//  ErrorModel.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//

import Foundation
struct ErrorModel {
  let title: String
  let message: String
  let retryButtonTitle: String
}
enum ErrorHelper {
  static func createGenericError() -> ErrorModel {
    return ErrorModel(title: "Error", message: "Something went wrong", retryButtonTitle: "Retry")
  }
}
