//
//  LayoutAnchor.swift
//  K1ngLayout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public class LayoutAnchor {
    /// Target view
    public weak var view: NSLayoutAnchorable?

    /// A type of anchor
    public let type: Type

    public init(view: NSLayoutAnchorable, type: Type) {
        self.view = view
        self.type = type
    }

    /**
     Creates constraint with **equal** type.

     - Parameter anchor: The target anchor.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
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

    /**
     Creates constraint with **lessOrEqual** type.

     - Parameter anchor: The target anchor.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
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

    /**
     Creates constraint with **greaterOrEqual** type.

     - Parameter anchor: The target anchor.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
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

// MARK: Nested types

public extension LayoutAnchor {
    /// Type of layout anchor
    enum `Type` {
        /// ↑ Top
        case top

        /// ↓ Bottom
        case bottom

        /// ← Left
        case left

        /// → Right
        case right

        /// ← Leading
        case leading

        /// → Trailing
        case trailing

        /// ↕ Vertical center
        case vCenter

        /// ↔ Horizontal center
        case hCenter

        /// [ Height
        case height

        /// ⎵ Width
        case width

        /// Is anchor is dimension
        var isDimension: Bool {
            switch self {
            case .height, .width: return true
            default: return false
            }
        }
    }
}
