//
//  UnitTableViewCell.swift
//  UConvert
//
//  Created by co5ta on 04/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

class UnitCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    var unit: Unit? {
        didSet { configure() }
    }
    
    private func configure() {
        guard let unit = unit else { return }
        titleLabel.text = Category.formatter.string(from: unit).capitalized
//        valueTextField.text = "0"
    }
}
