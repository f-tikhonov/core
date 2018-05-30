//
//  NotificationSetupView.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol NotificationSetupViewInput: class {
	func setupInitialState()
}

protocol NotificationSetupViewOutput: class {
	func viewIsReady()	
}

final class NotificationSetupView: UIViewController {

	// MARK: - Properties
	var presenter: NotificationSetupViewOutput!

    @IBOutlet private weak var tableView: UITableView!

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewIsReady()

        navigationItem.title = LS.NotificationSetup.title.localized()
        configureTableView()
	}

    func configureTableView() {
        tableView.register(UINib(nibName: C.TableView.SwitchCell.switchNibName, bundle: nil),
                           forCellReuseIdentifier: C.TableView.SwitchCell.switchCellID)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: C.TableView.DefaultCell.cellID)

        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = C.TableView.estimatedRowHeight
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: - UITableViewDataSource
extension NotificationSetupView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return C.TableView.sectionsCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = C.TableView.Sections.init(rawValue: section),
            let count = C.TableView.sectionsCellsCount[sectionType] else { return 0 }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = C.TableView.Sections(rawValue: indexPath.section) else { return UITableViewCell() }

        switch section {
        case .messages:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.TableView.SwitchCell.switchCellID) as! SwitchTableViewCell
            cell.output = self

            switch indexPath.row {
            case 0:
                cell.configure(title: LS.NotificationSetup.Messages.notifications.localized())
            case 1:
                cell.configure(title: LS.NotificationSetup.Messages.sound.localized())
            default:
                break
            }
            return cell
        case .groupChats:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.TableView.SwitchCell.switchCellID) as! SwitchTableViewCell
            cell.output = self

            switch indexPath.row {
            case 0:
                cell.configure(title: LS.NotificationSetup.GroupChats.notifications.localized())
            case 1:
                cell.configure(title: LS.NotificationSetup.GroupChats.sound.localized())
            default:
                break
            }
            return cell
        case .globalSettings:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.TableView.SwitchCell.switchCellID) as! SwitchTableViewCell
            cell.output = self

            switch indexPath.row {
            case 0:
                cell.configure(title: LS.NotificationSetup.GlobalSettings.sound.localized())
            case 1:
                cell.configure(title: LS.NotificationSetup.GlobalSettings.vibration.localized())
            default:
                break
            }
            return cell
        case .resetButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: C.TableView.DefaultCell.cellID)
            cell?.textLabel?.text = LS.NotificationSetup.ResetButton.title.localized()
            cell?.textLabel?.textColor = .red

            return cell!
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = C.TableView.Sections.init(rawValue: section) else { return nil }

        switch section {
        case .globalSettings:
            return LS.NotificationSetup.GlobalSettings.title.localized()
        case .groupChats:
            return LS.NotificationSetup.GroupChats.title.localized()
        case .messages:
            return LS.NotificationSetup.Messages.title.localized()
        case .resetButton:
            return nil
        }

    }
}

// MARK: - UITableViewDelegate
extension NotificationSetupView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if C.TableView.Sections(rawValue: indexPath.section) == .resetButton {
        }
    }
}

// MARK: - SwitchCellOutput
extension NotificationSetupView: SwitchCellOutput {
    func switchValueDidChange(_ cell: UITableViewCell, isOn: Bool) {
        guard let indexPath = tableView?.indexPath(for: cell) else { return }

    }
}

// MARK: - NotificationSetupViewInput
extension NotificationSetupView: NotificationSetupViewInput {
	func setupInitialState() {

	}
}

// MARK: - Constants
private enum C {
    struct TableView {
        static let sectionsCount: Int = 4
        static let sectionsCellsCount: [Sections: Int] = [.messages: 2,
                                                          .groupChats: 2,
                                                          .globalSettings: 2,
                                                          .resetButton: 1]
        enum Sections: Int {
            case messages = 0
            case groupChats
            case globalSettings
            case resetButton
        }

        static let estimatedRowHeight: CGFloat = 44.0

        struct SwitchCell {
            static let switchNibName: String = "SwitchTableViewCell"
            static let switchCellID: String = "SwitchTableViewCellIdentifier"
        }

        struct DefaultCell {
            static let cellID: String = "cellID"
        }
    }

}
