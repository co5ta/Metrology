//
//  MeasureViewController.swift
//  Metrology
//
//  Created by co5ta on 01/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

/// View controller of the units screen
class UnitsViewController: UIViewController {

    /// Table view of units
    @IBOutlet weak var unitsTableView: UITableView!
    
    /// Delegate of the units table view
    var unitsTableViewDelegate: UnitsTableViewDelegate?
    
    /// Coordinator
    weak var coordinator: MainCoordinator?
    
    /// Context of the view controller
    var mode = Mode.normal
    
    /// Variation selected
    var selectedVariation: Dimension?
    
    ///
    var previousScreen: UnitsViewController?
}

// MARK: - Life cycle
extension UnitsViewController {
    
    /// Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        unitsTableViewDelegate?.viewController = self
        addRightBarButton()
        addNotifications()
    }
    
    /// Adds right bar button according to the view controller context
    private func addRightBarButton() {
        if mode != .normal {
//            let button = UIBarButtonItem(title: "Reorder", style: .plain, target: self, action: #selector(toggleEditMode))
//            navigationItem.rightBarButtonItem = button
//        } else {
            let button = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectVariation))
            navigationItem.rightBarButtonItem = button
        }
    }
    
    /// Adds notifications
    private func addNotifications() {
        let valueChanged = Notification.Name("ValueChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: valueChanged, object: nil)
        let keyBoardWillShow = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(self, selector: #selector(resizeTableView(notification:)), name: keyBoardWillShow, object: nil)
    }
}

// MARK: - Actions
extension UnitsViewController {
    
    /// Updates the values in the table view
    @objc
    private func update(notification: Notification) {
        guard let dimensionChanged = notification.userInfo?["unitChanged"] as? DimensionViewModel,
              let newValue = Double(dimensionChanged.textChanged),
              let unitsTableViewDelegate = unitsTableViewDelegate
        else { return }
        let baseUnitValue = dimensionChanged.dimension.converter.baseUnitValue(fromValue: newValue)
        for index in 0..<unitsTableViewDelegate.dimensionVMs.count {
            guard let cell = unitsTableView.cellForRow(at: IndexPath(row: index, section: 0)) as? UnitCell else { return }
            cell.dimensionVM?.baseUnitValue = baseUnitValue
            cell.defaultVariation?.baseUnitValue = baseUnitValue
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
    
    /// Toggles the table view edit mode
    @objc
    private func toggleEditMode() {
        unitsTableView.isEditing.toggle()
    }
    
    /// Selects a variation
    @objc
    private func selectVariation() {
        guard let indexPath = unitsTableView.indexPathForSelectedRow,
              let cell = unitsTableView.cellForRow(at: indexPath) as? UnitCell,
              cell.accessoryType == .none,
              let dimension = mode.dimension,
              let selectedVariation = cell.dimensionVM?.dimension
        else { return }
        self.selectedVariation = selectedVariation
        Storage.save(variationSelected: selectedVariation, for: dimension)
        unitsTableView.reloadData()
        previousScreen?.unitsTableView.reloadData()
    }
}
