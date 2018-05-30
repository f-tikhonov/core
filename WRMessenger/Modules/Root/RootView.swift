//
//  RootView.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol RootViewInput: class {
	func setupInitialState()
}

protocol RootViewOutput: class {
	func viewIsReady()
}

final class RootView: UIViewController {

	// MARK: - Properties
	var presenter: RootViewOutput!

    @IBOutlet private weak var spinnerView: UIActivityIndicatorView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()

        view.backgroundColor = AppStyle.Color.mainBlue
        setupSpinner()
    }

    override func viewWillDisappear(_ animated: Bool) {
        spinnerView.stopAnimating()
    }

    private func setupSpinner() {
        spinnerView.hidesWhenStopped = true
        spinnerView.startAnimating()
    }
}

// MARK: - RootViewInput
extension RootView: RootViewInput {

	func setupInitialState() {

	}

}
