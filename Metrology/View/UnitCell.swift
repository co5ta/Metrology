//
//  UnitTableViewCell.swift
//  Metrology
//
//  Created by co5ta on 04/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

/// Cell of a unit
class UnitCell: UITableViewCell {
    
    /// Title of a unit
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Value of a unit
    @IBOutlet weak var valueTextField: UITextField!
    
    /// Unit to display
    var dimensionVM: DimensionViewModel? {
        didSet { configure() }
    }
    
    /// Base dimension of a variation
    var defaultVariation: DimensionViewModel?
    
    /// Configures the cell with data
    private func configure() {
        guard let dimensionVM = dimensionVM else { return }
        titleLabel.text = dimensionVM.title
        valueTextField.text = dimensionVM.textValue
        dimensionVM.bindValue = {
            let currentValue = Double(self.valueTextField.text ?? "0") ?? 0
            guard currentValue != dimensionVM.value else { return }
            self.valueTextField.text = dimensionVM.textValue
        }
    }
    
    /// Sends a notification to indicate the a value has changed
    @IBAction func valueTextFieldChanged(_ sender: UITextField) {
        guard let dimensionVM = dimensionVM,
            let textChanged = valueTextField.text,
            textChanged.last != "."
        else { return }
        dimensionVM.textChanged = textChanged.isEmpty ? "0" : textChanged
        let name = Notification.Name(rawValue: "ValueChanged")
        let unitChanged = ["unitChanged": dimensionVM]
        NotificationCenter.default.post(name: name, object: nil, userInfo: unitChanged)
    }
}
