//
//  UINavigationController+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

extension UINavigationController {

    func dark() -> UINavigationController {

        self.navigationBar.barTintColor = .black
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = false

        let backImage = UIImage(named: "close_icon")

        self.navigationBar.backIndicatorImage = backImage
        self.navigationBar.backIndicatorTransitionMaskImage = backImage

        UINavigationBar.appearance().tintColor = .brilliance
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)

        self.interactivePopGestureRecognizer?.isEnabled = false

        return self
    }
}
