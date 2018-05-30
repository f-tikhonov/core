//
//  ProfileAvatarTableViewCell.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/11/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol ProfileAvatarCellOutput: class {
  func handlePhotoClick()
}

class ProfileAvatarTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarView: AvatarView!
    @IBOutlet private weak var statusLabel: UILabel!

    weak var output: ProfileAvatarCellOutput?

    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    private func commonInit() {
        selectionStyle = .none

        let tap = UITapGestureRecognizer.init(target: self, action: #selector(handlePhotoClick))
        avatarView.addGestureRecognizer(tap)
        statusLabel.textColor = UIColor(red: 1/255, green: 164/255, blue: 239/255, alpha: 1)
    }

    // MARK: - Public funcs
    func configure(name: String?) {
        nameLabel.text = name
        avatarView.set(title: name ?? "", isOnline: false)
        statusLabel.isHidden = true
    }

    func configure(name: String?, avatar: UIImage) {
        nameLabel.text = name
        avatarView.set(image: avatar, isOnline: false)
        statusLabel.isHidden = true
    }

    func configure(name: String?, avatarURL: String) {
        nameLabel.text = name
        avatarView.set(imageURL: avatarURL, name: name, isOnline: false)
        statusLabel.isHidden = true
    }

    // MARK: - Private funcs
    @objc private func handlePhotoClick() {
        output?.handlePhotoClick()
    }

}
