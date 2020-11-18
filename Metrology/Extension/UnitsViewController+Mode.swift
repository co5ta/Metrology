//
//  UnitsViewController.swift
//  Metrology
//
//  Created by co5ta on 16/11/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

extension UnitsViewController {
    enum Mode: Equatable {
        case normal
        case variation(dimension: Dimension)
        
        var dimension: Dimension? {
            switch self {
            case .variation(let dimension):
                return dimension
            case .normal:
                return nil
            }
        }
    }
}
