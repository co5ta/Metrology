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
        let name = Notification.Name("ValueChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: name, object: nil)
    }
    
    /// Links the delegate to the table view
    private func bind() {
        viewController?.unitsTableView.dataSource = self
        viewController?.unitsTableView.delegate = self
    }
    
    /// Updates the table view
    @objc
    private func update(notification: Notification) {
        guard let unit = notification.userInfo?["unitChanged"] as? UnitViewModel,
            let value = Double(unit.textChanged)
            else { return }
        for index in 0..<units.count {
            guard units[index].unit != unit.unit else { continue }
            units[index].baseUnitValue = unit.unit.converter.baseUnitValue(fromValue: value)
        }
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
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UnitsTableViewDelegate: UITableViewDelegate {}
