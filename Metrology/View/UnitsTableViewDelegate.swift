//
//  UnitsTableViewDelegate.swift
//  Metrology
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
    var dimensionVMs: [DimensionViewModel] = []
    
    /// Initialization
    init(dimensionVMs: [DimensionViewModel]) {
        super.init()
        self.dimensionVMs = dimensionVMs
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
        return dimensionVMs.count
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath) as? UnitCell
        else { return UnitCell() }
        cell.dimensionVM = dimensionVMs[indexPath.row]
        cell.valueTextField.delegate = self
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .secondarySystemBackground
        toggleAccessoryType(in: cell)
        return cell
    }
    
    /// Adds an accessory type in the cell if necessary
    func toggleAccessoryType(in cell: UnitCell) {
        guard let viewController = viewController, let dimensionVM = cell.dimensionVM else { return }
        if viewController.mode == .normal {
            cell.accessoryType = (Category.getVariations(of: dimensionVM.dimension) != nil) ? .detailButton : .none
            guard let variationSelected = Storage.getVariationSelected(for: dimensionVM.dimension) else { return }
            cell.defaultVariation = cell.dimensionVM
            cell.dimensionVM = DimensionViewModel(dimension: variationSelected, baseUnitValue: dimensionVM.baseUnitValue)
        } else {
            cell.accessoryType = viewController.selectedVariation == dimensionVM.dimension ? .checkmark : .none
        }
    }
    
    /// Asks the delegate for the editing style of a row at a particular location in a table view
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    /// Asks the delegate whether the background of the specified row should be indented while the table view is in editing mode
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    /// Tells the data source to move a row at a specific location in the table view to another location
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let unitMoved = dimensionVMs[sourceIndexPath.row]
        dimensionVMs.remove(at: sourceIndexPath.row)
        dimensionVMs.insert(unitMoved, at: destinationIndexPath.row)
    }
}

// MARK: - UITableViewDelegate
extension UnitsTableViewDelegate: UITableViewDelegate {
    
    /// Selects the value text field when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UnitCell else { return }
        cell.valueTextField.isUserInteractionEnabled = true
        cell.valueTextField.becomeFirstResponder()
    }
    
    /// Tells the delegate that the user tapped the detail button for the specified row
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UnitCell,
              let dimensionVM = cell.dimensionVM,
              let defaultVariation = cell.defaultVariation,
              let variations = CategoryViewModel.getVariations(of: defaultVariation.dimension, with: defaultVariation.baseUnitValue)
        else { return }
        viewController?.coordinator?.showVariations(defaultVariation: defaultVariation,
                                                    variations: variations,
                                                    selectedVariation: dimensionVM.dimension,
                                                    previousScreen: viewController)
    }
}

// MARK: - UITextFieldDelegate
extension UnitsTableViewDelegate: UITextFieldDelegate {
    
    /// Forces the cell deselection
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isUserInteractionEnabled = false
    }
    
    /// Forces the point instead of the comma
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string == "," else { return true }
        textField.text! += "."
        return false
    }
}
