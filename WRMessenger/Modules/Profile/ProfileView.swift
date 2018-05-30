//
//  ProfileView.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit
import Photos

protocol ProfileViewInput: class {
    func setupInitialState(user: UserResultModel)
    func showAvatarSelection()
}

protocol ProfileViewOutput: class {
    func viewIsReady()
    func didTapEdit()
    func didTapPhoto()
    func didTapLogout()
    func didTapNotificationSetup()
}

// MARK: - Constants
private enum C {
    static let settingsCellsCount = 3

    static let avatarCellID = "avatarCellID"
    static let avatarCellNibName = "ProfileAvatarTableViewCell"

    static let actionCellID = "actionCellID"
    static let actionCellNibName = "ProfileActionTableViewCell"
}

// MARK: - ProfileCells
private enum ProfileCells: Int {
    case avatar = 0
    case notifications
    //  case language
    case logout
}

final class ProfileView: UIViewController {

	// MARK: - Properties
	var presenter: ProfileViewOutput!
    var user: UserResultModel!
    private var imagePicker: UIImagePickerController!

    @IBOutlet private weak var tableView: UITableView!


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()

        configureNavigation()
        setupImagePicker()

        tableView.separatorStyle = .none

        tableView.register(UINib(nibName: C.avatarCellNibName,
                                 bundle: nil),
                           forCellReuseIdentifier: C.avatarCellID)

        tableView.register(UINib(nibName: C.actionCellNibName,
                                 bundle: nil),
                           forCellReuseIdentifier: C.actionCellID)
    }

    // MARK: - Private funcs
    private func configureNavigation() {
        navigationItem.title = LS.Settings.title.localized()

        let editButton = UIBarButtonItem(barButtonSystemItem: .edit,
                                         target: self,
                                         action: #selector(handleEditTap))
        navigationItem.rightBarButtonItem = editButton
    }

    @objc func handleTap() {
        self.view.endEditing(true)
    }

    @objc func handleEditTap() {
        presenter.didTapEdit()
    }

    private func setupImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
    }

    func showAvatarSelection() {
        let actionSheetController = UIAlertController(title: nil,
                                                      message: nil,
                                                      preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: LS.Settings.cancel.localized(), style: .cancel)
        actionSheetController.addAction(cancelAction)

        // Choose picture from gallary
        let choosePictureAction = UIAlertAction(title: LS.Settings.selectPhoto.localized(),
                                                style: .default) { [weak self] action -> Void in
                                                    guard let strongSelf = self else { return }
                                                    strongSelf.imagePicker.sourceType = .photoLibrary
                                                    PhotosService.requesetAccess {
                                                        self?.present(strongSelf.imagePicker,
                                                                animated: true,
                                                                completion: nil)
                                                    }
        }
        actionSheetController.addAction(choosePictureAction)

        // Create picture with camera
        let takePictureAction = UIAlertAction(title: LS.Settings.createPhoto.localized(),
                                              style: .default) { [weak self] action -> Void in
                                                guard let strongSelf = self else { return }
                                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                                    strongSelf.imagePicker.sourceType = .camera
                                                    strongSelf.imagePicker.cameraCaptureMode = .photo
                                                    strongSelf.imagePicker.modalPresentationStyle = .fullScreen
                                                    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .authorized {
                                                        self?.present(strongSelf.imagePicker,
                                                                animated: true,
                                                                completion: nil)
                                                    } else {
                                                        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (result) in
                                                            if result {
                                                                self?.present(strongSelf.imagePicker,
                                                                        animated: true,
                                                                        completion: nil)
                                                            }
                                                        })
                                                        // TODO: Show alert with access control
                                                    }
                                                } else {
                                                    // TODO: Show alert with access control
                                                }
        }
        actionSheetController.addAction(takePictureAction)

        // Remove picture
        let removePictureAction = UIAlertAction(title: LS.Settings.removePhoto.localized(),
                                                style: .destructive) { [weak self] action -> Void in
                                                    self?.user.avatarImageURL = nil
        }
        actionSheetController.addAction(removePictureAction)

        present(actionSheetController,
                animated: true,
                completion: nil)
    }

}

// MARK: - ProfileViewInput
extension ProfileView: ProfileViewInput {
    func setupInitialState(user: UserResultModel) {
        self.user = user
	}
}

// MARK: - ProfileAvatarCellOutput
extension ProfileView: ProfileAvatarCellOutput {
    func handlePhotoClick() {
        presenter.didTapPhoto()
    }
}


// MARK: - UITableViewDelegate
extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let row = ProfileCells(rawValue: indexPath.row) else { return }
        switch row {
        case .logout:
            presenter.didTapLogout()
        case .notifications:
            presenter.didTapNotificationSetup()
        default: break
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ProfileView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        var chosenImage: UIImage? = nil
        if let img = info[UIImagePickerControllerEditedImage] as? UIImage {
            chosenImage = img
        } else {
            if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
                chosenImage = img
            }
        }
        guard let image = chosenImage else { return }

        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension ProfileView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return C.settingsCellsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = ProfileCells(rawValue: indexPath.row) else { return UITableViewCell() }

        switch row {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.avatarCellID) as! ProfileAvatarTableViewCell
            cell.output = self

            let name: String = "\(user.firstName ?? "") \(user.lastName ?? "")"
            if let avatarURL = user.avatarImageURL {
                cell.configure(name: name, avatarURL: avatarURL)
            } else {
                cell.configure(name: name)
            }

            return cell

        case .notifications:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.actionCellID) as! ProfileActionTableViewCell
            cell.set(title: LS.Settings.notificationSetup.localized(),
                     accessory: .disclosureIndicator)
            return cell

            //    case .language:
            //      let cell = tableView.dequeueReusableCell(withIdentifier: C.actionCellID) as! ProfileActionTableViewCell
            //      cell.set(title: LS.Settings.language.localized(),
            //               accessory: .disclosureIndicator)
            //      return cell

        case .logout:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.actionCellID) as! ProfileActionTableViewCell
            cell.set(title: LS.Settings.logout.localized(),
                     color: .red)
            return cell
        }
    }
}
