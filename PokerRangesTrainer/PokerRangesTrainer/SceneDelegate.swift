//
//  SceneDelegate.swift
//
//  Created by João Campos on 10/12/2023.
//

import UIKit

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let window = UIWindow()
    private let router = Router()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let interactor = Interactor()

        let presenter = Presenter(interactor: interactor, router: self.router)

        let viewController = ViewController(presenter: presenter)

        let navigationController = UINavigationController(rootViewController: viewController).dark()

        self.router.navigationController = navigationController

        window.windowScene = scene as? UIWindowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
