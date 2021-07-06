//
//  CustomNetworkError.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//

import Foundation
enum CustomNetworkError: Error {
  case unknownError
  case connectionError
  case invalidCredentials
  case invalidRequest
  case notFound
  case invalidResponse
  case serverError
  case serverUnavailable
  case timeOut
  case unsuppotedURL
}
