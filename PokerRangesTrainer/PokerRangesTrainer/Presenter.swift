//
//  Presenter.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterProtocol: AnyObject {}

final class Presenter {

    private let interactor: InteractorProtocol
    private unowned let router: RouterProtocol

    init(interactor: InteractorProtocol, router: RouterProtocol) {

        self.interactor = interactor
        self.router = router
    }
}

// MARK: - PresenterProtocol
extension Presenter: PresenterProtocol {}
