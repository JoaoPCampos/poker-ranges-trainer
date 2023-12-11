//
//  UIFactory.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

final class UIFactory {

    static let cornerRadius: CGFloat = 8

    static func button(title: String,
                       fontSize: CGFloat = 16,
                       backgroundColor: UIColor = .nero,
                       foregroundColor: UIColor = .brilliance,
                       highlightedColor: UIColor = .orange,
                       disabledColor: UIColor = .brilliance) -> UIButton {

        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)

        let button = UIButton(configuration: configuration, primaryAction: nil).unmask()

        let normalAttributedText = NSAttributedString(string: title, attributes: [.font: UIFont.bpmonoStencilBold(fontSize),
                                                                                  .foregroundColor: foregroundColor])

        let disabledAttributedText = NSAttributedString(string: title, attributes: [.font: UIFont.bpmonoStencilBold(fontSize),
                                                                                    .foregroundColor: disabledColor])

        let highlightedAttributedText = NSAttributedString(string: title, attributes: [.font: UIFont.bpmonoStencilBold(fontSize),
                                                                                    .foregroundColor: highlightedColor])
        button.setAttributedTitle(normalAttributedText, for: .normal)
        button.setAttributedTitle(disabledAttributedText, for: .disabled)
        button.setAttributedTitle(highlightedAttributedText, for: .highlighted)

        button.backgroundColor = backgroundColor

        button.layer.cornerRadius = UIFactory.cornerRadius
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.goshawkGrey.cgColor

        return button
    }

    static func label(text: String? = nil, fontSize: CGFloat = 20) -> UILabel {

        let label = UILabel.unmask()

        label.text = text
        label.font = UIFont.bpmonoStencil(fontSize)
        label.textColor = .brilliance

        return label
    }
}
