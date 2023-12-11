//
//  ViewController.swift
//
//  Created by João Campos on 10/12/2023.
//

import UIKit

class ViewController: BaseViewController {

    private let presenter: PresenterProtocol

    init(presenter: PresenterProtocol) {

        self.presenter = presenter

        super.init()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}

