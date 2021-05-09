//
//  LayoutAnchor.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public class LayoutAnchor {
    public weak var view: NSLayoutAnchorable?
    public let type: Type

    public init(view: NSLayoutAnchorable, type: Type) {
        self.view = view
        self.type = type
    }

    public func equal(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: anchor,
            type: .equal,
            constant: constant,
            priority: priority
        )
    }

    public func lessOrEqual(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: anchor,
            type: .lessOrEqual,
            constant: constant,
            priority: priority
        )
    }

    public func greaterOrEqual(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: anchor,
            type: .greaterOrEqual,
            constant: constant,
            priority: priority
        )
    }

    private func constraint(
        to anchor: LayoutAnchor,
        type: LayoutConstraint.`Type`,
        constant: CGFloat,
        priority: UILayoutPriority
    ) -> LayoutConstraint {
        return .init(
            from: self,
            to: anchor,
            type: type,
            multiplifier: 1,
            constant: constant,
            priority: priority
        )
    }
}

public extension LayoutAnchor {
    enum `Type` {
        case top
        case bottom
        case left
        case right
        case leading
        case trailing
        case vCenter
        case hCenter
        case height
        case width

        var isDimension: Bool {
            switch self {
            case .height, .width: return true
            default: return false
            }
        }
    }
}
