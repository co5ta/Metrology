//
//  MainCoordinator.swift
//  UConvert
//
//  Created by co5ta on 14/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

/// Main coordinator of the app
class MainCoordinator: Coordinator {
    
    /// View controller to show
    let navigationController: UINavigationController
    
    /// Initialization
    init(navigation: UINavigationController) {
        navigationController = navigation
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    /// Shows the root screen of the navigation
    func start() {
        showCategories()
    }
    
    /// Shows the categories screen
    func showCategories() {
        guard let categoriesVC = CategoryViewController.instantiate() else { return }
        categoriesVC.coordinator = self
        navigationController.pushViewController(categoriesVC, animated: true)
    }
    
    /// Shows the units screen
    func showUnits(of categoryVM: CategoryViewModel) {
        guard let unitsVC = UnitsViewController.instantiate() else { return }
        unitsVC.coordinator = self
        unitsVC.screenTitle = categoryVM.title
        unitsVC.units = categoryVM.units
        navigationController.pushViewController(unitsVC, animated: true)
    }
    
    ///
    func showVariations(of dimension: UnitViewModel, units: [UnitViewModel], previousScreen: UnitsViewController?) {
        guard let unitsVC = UnitsViewController.instantiate() else { return }
        unitsVC.coordinator = self
        unitsVC.screenTitle = dimension.title
        unitsVC.units = units
        unitsVC.mode = .variation(dimension: dimension.unit)
        unitsVC.variationSelected = Storage.getVariationSelected(for: dimension.unit) ?? dimension.unit
        unitsVC.previousScreen = previousScreen
        navigationController.pushViewController(unitsVC, animated: true)
    }
}
