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
    }
}
