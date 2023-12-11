//
//  Identifiable.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

protocol Identifiable {

    var name: String { get }

    static var identifier: String { get }
}

extension Identifiable {

    var name: String {

        return String(describing: type(of: self))
    }

    static var identifier: String {

        return String(describing: self)
    }
}
