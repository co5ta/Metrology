//
//  UnitsTableViewDelegate.swift
//  UConvert
//
//  Created by co5ta on 02/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

/// Delegate of the units table view
class UnitsTableViewDelegate: NSObject {
    
    /// View controller containing the table view
    weak var viewController: UnitsViewController? {
        didSet { bind() }
    }
    
    /// Units to display
    var units: [UnitViewModel] = []
    
    /// Initialization
    init(units: [UnitViewModel]) {
        super.init()
        self.units = units
    }
    
    /// Links the delegate to the table view
    private func bind() {
        viewController?.unitsTableView.dataSource = self
        viewController?.unitsTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension UnitsTableViewDelegate: UITableViewDataSource {
    
    /// Tells the data source to return the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath) as? UnitCell
            else { return UnitCell() }
        cell.unit = units[indexPath.row]
        cell.valueTextField.delegate = self
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .secondarySystemBackground
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UnitsTableViewDelegate: UITableViewDelegate {
    
    /// Selects the value text field when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UnitCell else { return }
        cell.valueTextField.becomeFirstResponder()
    }
}

// MARK: - UITextFieldDelegate
extension UnitsTableViewDelegate: UITextFieldDelegate {
    
    /// Selects the cell when a value text field is selected
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let contentView = textField.superview,
            let cell = contentView.superview as? UnitCell
            else { return }
        cell.isSelected = true
    }
    
    /// Forces the cell deselection
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let contentView = textField.superview,
            let cell = contentView.superview as? UnitCell
            else { return }
        cell.isSelected = false
    }
}
