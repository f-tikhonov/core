//
//  SwitchTableViewCell.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/16/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol SwitchCellOutput: class {
  func switchValueDidChange(_ cell: UITableViewCell, isOn: Bool)
}

class SwitchTableViewCell: UITableViewCell {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var switchView: UISwitch!

  weak var output: SwitchCellOutput!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  @IBAction func handleSwitchAction(_ sender: UISwitch) {
    output?.switchValueDidChange(self, isOn: sender.isOn)
  }

  func configure(title: String) {
    titleLabel?.text = title
  }
}
