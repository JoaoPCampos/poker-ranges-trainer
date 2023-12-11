//
//  BaseView.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

class BaseView: UIView, Identifiable {

    init() {

        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {

        /// Debugging
        print(self.name + " was deallocated")
    }
}
