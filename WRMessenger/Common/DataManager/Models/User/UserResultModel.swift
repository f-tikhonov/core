//
//  UserResultModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct UserResultModel: Decodable {

    var userIdentifier: String?
    var username: String?
    var firstName: String?
    var lastName: String?
    var middleName: String?
    var createDate: String?
    var email: String?
    var avatarImageURL: String?
    var isDeleted: Bool?

    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }

    // MARK: - Decodable
    private enum RootKeys: String, CodingKey {
        case id = "id"
        case username = "uas_user_name"
        case firstName = "uas_user_first_name"
        case lastName = "uas_user_last_name"
        case middleName = "uas_user_middle_name"
        case createDate = "uas_user_create_date"
        case email = "uas_user_email"
        case avatarImageURL = "uas_user_photo"
        case isDeleted = "deleted"
    }

    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)

        userIdentifier = try? container.decode(String.self, forKey: .id)
        username = try? container.decode(String.self, forKey: .username)
        firstName = try? container.decode(String.self, forKey: .firstName)
        lastName = try? container.decode(String.self, forKey: .lastName)
        middleName = try? container.decode(String.self, forKey: .middleName)
        createDate = try? container.decode(String.self, forKey: .createDate)
        email = try? container.decode(String.self, forKey: .email)
        avatarImageURL = try? container.decode(String.self, forKey: .avatarImageURL)
        isDeleted = try? container.decode(Bool.self, forKey: .isDeleted)
    }

    internal init(userIdentifier: String?,
                  username: String?,
                  firstName: String?,
                  lastName: String?,
                  middleName: String?,
                  createDate: String?,
                  email: String?,
                  avatarImageURL: String?,
                  isDeleted: Bool?) {
        self.userIdentifier = userIdentifier
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.createDate = createDate
        self.email = email
        self.avatarImageURL = avatarImageURL
        self.isDeleted = isDeleted
    }
}
