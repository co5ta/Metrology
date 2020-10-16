//
//  UIViewController.swift
//  UConvert
//
//  Created by co5ta on 16/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Instantites easily a view controller from the storyboard
    static func instantiate() -> Self? {
        guard let identifier = NSStringFromClass(self).components(separatedBy: ".").last,
            let viewController = UIStoryboard(name: "Main", bundle: Bundle.main)
                .instantiateViewController(identifier: identifier) as? Self
            else { return nil }
        return viewController
    }
}
