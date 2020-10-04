//
//  MeasureViewController.swift
//  UConvert
//
//  Created by co5ta on 01/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

class UnitsViewController: UIViewController {

    var category: CategoryViewModel!
    @IBOutlet weak var unitsTableView: UITableView!
    lazy var unitsTableViewDelegate = UnitsTableViewDelegate(category: category)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category.title
        unitsTableViewDelegate.viewController = self
    }
}
