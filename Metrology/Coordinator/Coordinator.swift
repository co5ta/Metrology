//
//  Coordinator.swift
//  Metrology
//
//  Created by co5ta on 14/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
