//
//  Collection+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

extension Collection {

    subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
