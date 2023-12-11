//
//  NSLayoutAnchor+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit
import Foundation

public extension NSLayoutAnchor {

    @objc
    @discardableResult
    func bind(_ relation: NSLayoutConstraint.Relation = .equal,
              to anchor: NSLayoutAnchor,
              prio: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint: NSLayoutConstraint

        switch relation {

        case .equal:

            constraint = self.constraint(equalTo: anchor)

        case .greaterThanOrEqual:

            constraint = self.constraint(greaterThanOrEqualTo: anchor)

        case .lessThanOrEqual:

            constraint = self.constraint(lessThanOrEqualTo: anchor)

        @unknown default:

            fatalError()
        }

        constraint.priority = prio
        constraint.isActive = true

        return constraint
    }
}
