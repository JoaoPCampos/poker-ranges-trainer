//
//  Router.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

final class Router {

    weak var navigationController: UINavigationController?
}

// MARK: - RouterProtocol
extension Router: RouterProtocol {

    func navigateTo() {}
}
