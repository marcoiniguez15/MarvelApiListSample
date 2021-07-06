//
//  EnviromentService.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//

import Foundation

enum EnvironmentService {
  enum Keys {
    case URL(URLKeys)

    var rawValue: String {
      switch self {        
      case let .URL(key):
        return key.rawValue
      }
    }
  }

  enum URLKeys: String {
    case baseURL = "BASE_URL"
    case privateKey = "PRIVATE_KEY"
    case publicKey = "PUBLIC_KEY"
  }

  static func getValue(for key: Keys) -> String {
    infoForKey(key.rawValue)!
  }
}

private extension EnvironmentService {

  static func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?
      .replacingOccurrences(of: "\\", with: "")
  }
}
