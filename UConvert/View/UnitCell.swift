//
//  UnitTableViewCell.swift
//  UConvert
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
    var unit: UnitViewModel? {
        didSet { configure() }
    }
    
    /// Configures the cell with data
    private func configure() {
        guard let unit = unit else { return }
        titleLabel.text = unit.title
        valueTextField.text = unit.value
        unit.bindValue = {
            self.valueTextField.text = unit.value
        }
    }
    
    /// Sends a notification to indicate the a value has changed
    @IBAction func valueTextFieldChanged(_ sender: UITextField) {
        guard let unit = unit,
            let textChanged = valueTextField.text,
            textChanged.last != "."
            else { return }
        unit.textChanged = textChanged.isEmpty ? "0" : textChanged
        let name = Notification.Name(rawValue: "ValueChanged")
        let unitChanged = ["unitChanged": unit]
        NotificationCenter.default.post(name: name, object: nil, userInfo: unitChanged)
    }
}
