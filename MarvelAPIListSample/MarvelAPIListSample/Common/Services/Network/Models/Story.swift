//
//  Story.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 5, 2021

import Foundation

struct Story : Codable {
  let available : Int?
  let collectionURI : String?
  let returned : Int?
  
  enum CodingKeys: String, CodingKey {
    case available = "available"
    case collectionURI = "collectionURI"
    case returned = "returned"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    available = try values.decodeIfPresent(Int.self, forKey: .available)
    collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
    returned = try values.decodeIfPresent(Int.self, forKey: .returned)
  }
  
}