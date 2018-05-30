//
//  LocalizationConstants.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/22/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct LS {

    // MARK: - TabBar
    struct TabBar {
        static let contacts = "TabBar.Contacts"
        static let chats = "TabBar.Chats"
        static let profile = "TabBar.Profile"
        static let settings = "TabBar.Settings"
    }
    
    // MARK: - Global
    struct Global {
        static let ok = "Global.Ok"
    }

    // MARK: - Login
    struct Login {
        static let title = "Login.title"

        struct LoginTextField {
            static let placeholder = "Login.LoginTextField.placeholder"
        }

        struct PasswordTextField {
            static let placeholder = "Login.PasswordTextField.placeholder"
        }

        struct RegistrationButton {
            static let title = "Login.RegistrationButton.title"
        }

        struct Error {
            static let title = "Login.Error.title"
            static let emptyLogin = "Login.Error.emptyLogin"
            static let emptyPassword = "Login.Error.emptyPassword"
            static let incorrentLogin = "Login.Error.incorrentLogin"
            static let incorrectPassword = "Login.Error.incorrectPassword"
        }
    }

    // MARK: - Registration
    struct Registration {
        static let title = "Registration.title"

        struct FirstNameTextField {
            static let placeholder = "Registration.FirstNameTextField.placeholder"
        }

        struct LastNameTextField {
            static let placeholder = "Registration.LastNameTextField.placeholder"
        }

        struct EmailTextField {
            static let placeholder = "Registration.EmailTextField.placeholder"
        }

        struct PhoneNameTextField {
            static let placeholder = "Registration.PhoneNameTextField.placeholder"
        }

        struct PasswordTextField {
            static let placeholder = "Registration.PasswordTextField.placeholder"
        }

        struct ConfirmPasswordTextField {
            static let placeholder = "Registration.ConfirmPasswordTextField.placeholder"
        }

        struct Error {
            static let title = "Registration.Error.title"
            static let emptyField = "Registration.Error.emptyField"
        }
    }

    // MARK: - Settings
    struct Settings {
        static let title = "Settings.NavigationItem.Title"
        static let logout = "Settings.TableViewCell.Logout"
        static let notificationSetup = "Settings.TableViewCell.NotificationSetup"
        static let language = "Settings.TableViewCell.Language"
        static let cancel = "Settings.ActionSheet.Cancel"
        static let selectPhoto = "Settings.ActionSheet.SelectPhoto"
        static let createPhoto = "Settings.ActionSheet.CreatePhoto"
        static let removePhoto = "Settings.ActionSheet.RemovePhoto"
    }

    // MARK: - Profile Edit
    struct ProfileEdit {
        static let title = "ProfileEdit.NavigationItem.Title"

        struct FirstNameTextField {
            static let placeholder = "ProfileEdit.FirstNameTextField.Placeholder"
        }
        struct LastNameTextField {
            static let placeholder = "ProfileEdit.LastNameTextField.Placeholder"
        }
        struct SaveButton {
            static let title = "ProfileEdit.SaveButton.Placeholder"
        }
        struct Alert {
            static let success = "ProfileEdit.Alert.Success"
            static let successfullyUpdated = "ProfileEdit.Alert.SuccessfullyUpdated"

            static let fail = "ProfileEdit.Alert.Fail"
        }
    }

    // MARK: - Notification setup
    struct NotificationSetup {
        static let title = "NotificationSetup.Title"

        struct ResetButton {
            static let title = "NotificationSetup.ResetButton.Title"
        }
        struct Messages {
            static let title = "NotificationSetup.Messages.Title"
            static let notifications = "NotificationSetup.Messages.Notifications"
            static let sound = "NotificationSetup.Messages.Sound"
        }
        struct GroupChats {
            static let title = "NotificationSetup.GroupChats.Title"
            static let notifications = "NotificationSetup.GroupChats.Notifications"
            static let sound = "NotificationSetup.GroupChats.Sound"
        }
        struct GlobalSettings {
            static let title = "NotificationSetup.GlobalSettings.Title"
            static let sound = "NotificationSetup.GlobalSettings.Notifications"
            static let vibration = "NotificationSetup.GlobalSettings.Vibration"
        }
    }

    // MARK: - Users module
    struct UsersList {
        static let title = "UsersList.NavigationItem.Title"
        static let searchPlaceholder = "UsersList.Search.Placeholder"
        static let addContactSuccess = "UsersList.Search.AddContactSuccess"
        static let addContactFailure = "UsersList.Search.AddContactFailure"
    }
}
