//
//  BaseViewController.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    init() {

        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Unavailable xib or storyboard inits
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - deinit
    deinit {

        /// Debugging
        print(self.name + " was deallocated")
    }
}

// MARK: - Protocol Identifiable
extension BaseViewController: Identifiable {}
