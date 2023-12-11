//
//  UICollectionView+Extension.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

extension UICollectionView {

    func deselectAllItems(animated: Bool) {

        guard let selectedItems = self.indexPathsForSelectedItems else { return }

        for indexPath in selectedItems { self.deselectItem(at: indexPath, animated: animated) }
    }
}
