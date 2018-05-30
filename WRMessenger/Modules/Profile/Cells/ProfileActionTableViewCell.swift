//
//  ProfileActionTableViewCell.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/11/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

class ProfileActionTableViewCell: UITableViewCell {

  @IBOutlet private weak var titleLabel: UILabel!

  override func prepareForReuse() {
    titleLabel.textColor = .black
  }

  // MARK: - Public funcs
  func set(title: String,
           color: UIColor = .black,
           accessory: UITableViewCellAccessoryType = .none) {
    accessoryType = accessory
    titleLabel?.text = title
    titleLabel.textColor = color
  }
}
