//
//  CharacterDetailTableViewCell.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {
  @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Public
extension CharacterDetailTableViewCell {
  
  func prepareCell(with model: CharacterDetailModel.CellModel) {
    titleLabel.text = model.title
  }
}

