//
//  UIFont+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit
import Foundation

extension UIFont {

    static func bpmonoStencilBold(_ size: CGFloat) -> UIFont {

        guard let font = UIFont(name: "BPmonoStencil-Bold", size: size) else {

            preconditionFailure("Unable to create font with name BPmonoStencil-Bold")
        }

        return font
    }

    static func bpmonoStencil(_ size: CGFloat) -> UIFont {

        guard let font = UIFont(name: "BPmonoStencil", size: size) else {

            preconditionFailure("Unable to create font with name BPmonoStencil")
        }

        return font
    }
}
