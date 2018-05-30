//
//  AppView.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol AppViewInput: class {
	func setupInitialState()
}

protocol AppViewOutput: class {
	func viewIsReady()	
}

final class AppView: UITabBarController {

	// MARK: - Properties
	var presenter: AppViewOutput!

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewIsReady()

        tabBarSetup()
	}

    // MARK: - Setup
    func tabBarSetup() {
        selectedIndex = 1

        // Contacts
        tabBar.items?[0].title = LS.TabBar.contacts.localized()
        tabBar.items?[0].image = #imageLiteral(resourceName: "iconTabBarContacts")

        // Chat List
        tabBar.items?[1].title = LS.TabBar.chats.localized()
        tabBar.items?[1].image = #imageLiteral(resourceName: "iconTabBarChats")

        // Settings
        tabBar.items?[2].title = LS.TabBar.settings.localized()
        tabBar.items?[2].image = #imageLiteral(resourceName: "iconTabBarSettings")
    }
}

// MARK: - AppViewInput
extension AppView: AppViewInput {

	func setupInitialState() {

	}

}
