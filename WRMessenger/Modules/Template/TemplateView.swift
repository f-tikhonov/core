//
//  TemplateView.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol TemplateViewInput: class {
	func setupInitialState()
}

protocol TemplateViewOutput: class {
	func viewIsReady()	
}

final class TemplateView: UIViewController {

	// MARK: - Properties
	var presenter: TemplateViewOutput!

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewIsReady()
	}

}

// MARK: - TemplateViewInput
extension TemplateView: TemplateViewInput {

	func setupInitialState() {

	}

}
