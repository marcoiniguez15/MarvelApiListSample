//
//  BaseView.swift
//  MarvelAPIListSample
//
//  Created by marco.iniguez.ollero on 2/7/21.
//

import UIKit

class BaseView: UIView {
  @IBOutlet weak var view: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    view = nibSetup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    view = nibSetup()
  }
}
