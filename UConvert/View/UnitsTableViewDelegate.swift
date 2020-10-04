//
//  UnitsTableViewDelegate.swift
//  UConvert
//
//  Created by co5ta on 02/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

class UnitsTableViewDelegate: NSObject {
    var viewController: UnitsViewController? {
        didSet { bind() }
    }
    var units: [Unit] = [] {
        didSet { update() }
    }
    
    init(category: CategoryViewModel) {
        units = category.units
    }
    
    private func bind() {
        viewController?.unitsTableView.dataSource = self
        viewController?.unitsTableView.delegate = self
    }
    
    private func update() {
        viewController?.unitsTableView.reloadData()
    }
}

extension UnitsTableViewDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath) as? UnitCell
            else { return UnitCell() }
        cell.unit = units[indexPath.row]
        return cell
    }
}

extension UnitsTableViewDelegate: UITableViewDelegate {}
