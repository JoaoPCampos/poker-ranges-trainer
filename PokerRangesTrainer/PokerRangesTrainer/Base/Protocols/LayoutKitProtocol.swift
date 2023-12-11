//
//  LayoutKitProtocol.swift
//
//  Created by João Campos
//  Copyright © 2023 João Campos. All rights reserved.
//

import UIKit

public protocol LayoutKitProtocol {

    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }

    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }

    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
}

public extension LayoutKitProtocol {

    @discardableResult
    func edge(_ relation: NSLayoutConstraint.Relation = .equal,
              to item: LayoutKitProtocol,
              insets: [UIEdgeInsets] = [],
              prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        let inset: UIEdgeInsets = insets.isEmpty ? .zero : self.edgeInset(combining: insets)

        return self.internalEdge(relation, edges: LayoutKitAttribute.allCases, to: item, inset: inset, prio: prio)
    }

    @discardableResult
    func edge(onlyTo edges: [LayoutKitAttribute],
              as relation: NSLayoutConstraint.Relation = .equal,
              to item: LayoutKitProtocol,
              insets: [UIEdgeInsets] = [],
              prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        let inset: UIEdgeInsets = insets.isEmpty ? .zero : self.edgeInset(combining: insets, filter: edges)

        return self.internalEdge(relation, edges: edges, to: item, inset: inset, prio: prio)
    }

    @discardableResult
    func center(_ relation: NSLayoutConstraint.Relation = .equal,
                in item: LayoutKitProtocol,
                add margin: LayoutKitMargin = .zero,
                prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        return [
            self.centerXAnchor.bind(relation, to: item.centerXAnchor, prio: prio).addSpace(margin),
            self.centerYAnchor.bind(relation, to: item.centerYAnchor, prio: prio).addSpace(margin)
        ]
    }

    @discardableResult
    func size(_ relation: NSLayoutConstraint.Relation = .equal,
              to attributes: LayoutKitSizeAttribute...,
              prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        guard attributes.isEmpty == false else { return [] }

        return attributes.map {

            switch $0 {

            case .height(let value):

                return self.heightAnchor.bind(relation, to: value, prio: prio)

            case .width(let value):

                return self.widthAnchor.bind(relation, to: value, prio: prio)
            }
        }
    }
}

public extension LayoutKitProtocol where Self: UIView {

    @discardableResult
    func edgeToSuperview(_ relation: NSLayoutConstraint.Relation = .equal,
                         insets: [UIEdgeInsets] = [],
                         prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        guard let superview = self.superview else { return [] }

        let inset: UIEdgeInsets = insets.isEmpty ? .zero : self.edgeInset(combining: insets)

        return self.internalEdge(relation, edges: LayoutKitAttribute.allCases, to: superview, inset: inset, prio: prio)
    }

    @discardableResult
    func centerInSuperView(as relation: NSLayoutConstraint.Relation = .equal,
                           add margin: LayoutKitMargin = .zero,
                           prio: UILayoutPriority = .required) -> [NSLayoutConstraint] {

        guard let superView = self.superview else { return [] }

        return [
            self.centerXAnchor.bind(relation, to: superView.centerXAnchor, prio: prio).addSpace(margin),
            self.centerYAnchor.bind(relation, to: superView.centerYAnchor, prio: prio).addSpace(margin)
        ]
    }
}

internal extension LayoutKitProtocol {

    func edgeInset(combining insets: [UIEdgeInsets], filter: [LayoutKitAttribute] = []) -> UIEdgeInsets {

        let top = insets.map({ $0.top }).reduce(0, +)
        let bottom = insets.map({ $0.bottom }).reduce(0, +)
        let left = insets.map({ $0.left }).reduce(0, +)
        let right = insets.map({ $0.right }).reduce(0, +)

        guard filter.isEmpty else {

            let combinedTop = filter.contains(.top) ? top : 0
            let combinedBottom = filter.contains(.bottom) ? bottom : 0
            let combinedLeading = filter.contains(.leading) ? left : 0
            let combinedTrailing = filter.contains(.trailing) ? right : 0

            return UIEdgeInsets(top: combinedTop, left: combinedLeading, bottom: combinedBottom, right: combinedTrailing)
        }

        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    func internalEdge(_ relation: NSLayoutConstraint.Relation,
                      edges: [LayoutKitAttribute],
                      to item: LayoutKitProtocol,
                      inset: UIEdgeInsets,
                      prio: UILayoutPriority) -> [NSLayoutConstraint] {

        return edges.map {

            let constraint: NSLayoutConstraint
            let margin: LayoutKitMargin

            switch $0 {

            case .top:

                margin = .inset(inset.top)
                constraint = self.topAnchor.bind(relation,
                                                 to: item.topAnchor,
                                                 prio: prio).addSpace(margin)

            case .bottom:

                margin = .inset(inset.bottom)
                constraint = self.bottomAnchor.bind(relation,
                                                    to: item.bottomAnchor,
                                                    prio: prio).addSpace(margin)

            case .leading:

                margin = .inset(inset.left)
                constraint = self.leadingAnchor.bind(relation,
                                                     to: item.leadingAnchor,
                                                     prio: prio).addSpace(margin)

            case .trailing:

                margin = .inset(inset.right)
                constraint = self.trailingAnchor.bind(relation,
                                                      to: item.trailingAnchor,
                                                      prio: prio).addSpace(margin)
            }

            return constraint
        }
    }
}
