//
//  MeasureViewController.swift
//  UConvert
//
//  Created by co5ta on 01/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

/// View controller of the units screen
class UnitsViewController: UIViewController {

    /// Units table view
    @IBOutlet weak var unitsTableView: UITableView!
    
    /// Category of units
    var category: CategoryViewModel!
    
    /// Delegate of the units table view
    lazy var unitsTableViewDelegate = UnitsTableViewDelegate(units: category.units)
    
    /// Coordinator
    weak var coordinator: MainCoordinator?
    
    /// Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category.title
        navigationItem.largeTitleDisplayMode = .never
        unitsTableViewDelegate.viewController = self
        addNotifications()
    }
    
    /// Adds notifications
    private func addNotifications() {
        let valueChanged = Notification.Name("ValueChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: valueChanged, object: nil)
        let keyBoardWillShow = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(self, selector: #selector(resizeTableView(notification:)), name: keyBoardWillShow, object: nil)
    }
    
    /// Updates the values in the table view
    @objc
    private func update(notification: Notification) {
        guard let unit = notification.userInfo?["unitChanged"] as? UnitViewModel,
            let value = Double(unit.textChanged)
            else { return }
        for index in 0..<unitsTableViewDelegate.units.count {
            guard unitsTableViewDelegate.units[index].unit != unit.unit else { continue }
            unitsTableViewDelegate.units[index].baseUnitValue = unit.unit.converter.baseUnitValue(fromValue: value)
        }
    }
    
    /// Prevents the bottom of the table view to be hidden by the keyboard
    @objc
    private func resizeTableView(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyBoardViewEndFrame = view.convert(keyboardFrame.cgRectValue, to: view.window)
        let bottomInset = keyBoardViewEndFrame.height - view.safeAreaInsets.bottom
        unitsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        guard let indexSelectedRow = unitsTableView.indexPathForSelectedRow else { return }
        unitsTableView.scrollIndicatorInsets = unitsTableView.contentInset
        unitsTableView.scrollToRow(at: indexSelectedRow, at: .none, animated: true)
    }
}
