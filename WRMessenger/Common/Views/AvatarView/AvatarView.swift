//
//  AvatarView.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/15/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit
import Kingfisher


class AvatarView: UIView {

  @IBOutlet private var contentView: UIView!

  // Text avatar
  @IBOutlet private weak var textAvatarView: UIView!
  @IBOutlet private weak var shortNameLabel: UILabel!

  // Image avatar
  @IBOutlet private weak var avatarImageView: UIImageView!
  @IBOutlet private weak var onlineStatusView: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  func commonInit() {
    Bundle.main.loadNibNamed("AvatarView",
                             owner: self,
                             options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight,
                                    .flexibleWidth]

    setNeedsLayout()
    layoutIfNeeded()

    configureColorAvatar()

    avatarImageView.clipsToBounds = true
    textAvatarView.clipsToBounds = true
    onlineStatusView.clipsToBounds = true
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    textAvatarView.layer.cornerRadius = textAvatarView.bounds.height / 2
    onlineStatusView.layer.cornerRadius = onlineStatusView.bounds.height / 2
  }

  private func configureColorAvatar() {
    // Avatar color
    let gradient = CAGradientLayer()
    gradient.frame = textAvatarView.bounds
    let lightColor = C.Color.lightColor.cgColor
    let darkColor = C.Color.darkColor.cgColor
    gradient.colors = [lightColor, darkColor]
    textAvatarView.layer.insertSublayer(gradient, at: 0)

    // Online status color
    onlineStatusView.backgroundColor = C.Color.onlineColor
    onlineStatusView.layer.borderColor = UIColor.white.cgColor
    onlineStatusView.layer.borderWidth = onlineStatusView.frame.height / 8
  }

  func set(imageURL: String, name: String?, isOnline: Bool) {
    onlineStatusView.isHidden = !isOnline

    set(title: name ?? "", isOnline: isOnline)

    guard let url = URL(string: imageURL) else { return }
    avatarImageView.kf.setImage(with: url) { [weak self] (_, _, _, _) in
        self?.show(avatar: .image)
    }
  }

  func set(image: UIImage, isOnline: Bool) {
    show(avatar: .image)
    onlineStatusView.isHidden = !isOnline
    avatarImageView.image = image

    setNeedsLayout()
  }

  /// Creates title from the full name
  func set(title: String?, isOnline: Bool) {
    show(avatar: .text)

    let withoutEmpties = title?.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
    let initials = withoutEmpties?.reduce("") {
      ($0.isEmpty ? "" : "\($0.uppercased().first!)") + ($1.isEmpty ? "" : "\($1.uppercased().first!)")
    }

    onlineStatusView.isHidden = !isOnline
    shortNameLabel.text = initials

    setNeedsLayout()
  }

  private enum AvatarType {
    case image
    case text
  }

  private func show(avatar type: AvatarType) {
    textAvatarView.isHidden = type == .text ? false : true
    avatarImageView.isHidden = !textAvatarView.isHidden
  }

}

// MARK: - Constants
private enum C {
  struct Color {
    static let lightColor = UIColor.init(red: 218/255, green: 153/255, blue: 237/255, alpha: 1)
    static let darkColor = UIColor.init(red: 212/255, green: 96/255, blue: 232/255, alpha: 1)
    static let onlineColor = UIColor.init(red: 128/255, green: 219/255, blue: 0/255, alpha: 1)
  }
}
