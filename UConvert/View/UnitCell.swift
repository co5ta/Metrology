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
        valueTextField.text = "\(unit.value)"
    }
}
