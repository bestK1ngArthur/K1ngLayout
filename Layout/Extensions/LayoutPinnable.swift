//
//  LayoutPinnable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutPinnable {
    // MARK: All edges with equal constant

    /**
     Pins all edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins all edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinLessOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins all edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinGreaterOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: All edges with insets

    /**
     Pins all edges of view to other view with **equal** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins all edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinLessOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins all edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinGreaterOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins all edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinEdges(to view: UIView, type: LayoutConstraint.`Type`, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: Vertical edges with equal constant

    /**
     Pins vertical edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins vertical edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinLessOrEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins vertical edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinGreaterOrEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins vertical edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinVerticalEdges(to view: UIView, type: LayoutConstraint.`Type`, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: Horizontal edges with equal constant

    /**
     Pins horizontal edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins horizontal edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinLessOrEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins horizontal edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinGreaterOrEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    /**
     Pins horizontal edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.
     - Parameter constant: The constant value of pin constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func pinHorizontalEdges(to view: UIView, type: LayoutConstraint.`Type`, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
}

// MARK: -

extension UIView: LayoutPinnable {
    // MARK: All edges with equal constant

    /**
     Pins all edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinEqualEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .equal,
            insets: .init(top: constant, left: constant, bottom: constant, right: constant),
            priority: priority
        )
    }

    /**
     Pins all edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinLessOrEqualEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .lessOrEqual,
            insets: .init(top: constant, left: constant, bottom: constant, right: constant),
            priority: priority
        )
    }

    /**
     Pins all edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinGreaterOrEqualEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .greaterOrEqual,
            insets: .init(top: constant, left: constant, bottom: constant, right: constant),
            priority: priority
        )
    }

    // MARK: All edges with insets

    /**
     Pins all edges of view to other view with **equal** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinEqualEdges(
        to view: UIView,
        insets: EdgeInsets,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .equal,
            insets: insets,
            priority: priority
        )
    }

    /**
     Pins all edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinLessOrEqualEdges(
        to view: UIView,
        insets: EdgeInsets,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .lessOrEqual,
            insets: insets,
            priority: priority
        )
    }

    /**
     Pins all edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinGreaterOrEqualEdges(
        to view: UIView,
        insets: EdgeInsets,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinEdges(
            to: view,
            type: .greaterOrEqual,
            insets: insets,
            priority: priority
        )
    }

    /**
     Pins all edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.  Default is `.equal`.
     - Parameter insets: The insets from target view edges.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinEdges(
        to view: UIView,
        type: LayoutConstraint.`Type` = .equal,
        insets: EdgeInsets,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return [
            .init(
                from: .init(view: self, type: .top),
                to: .init(view: view, type: .top),
                type: type,
                multiplifier: 1,
                constant: insets.top,
                priority: priority
            ),
            .init(
                from: .init(view: self, type: .bottom),
                to: .init(view: view, type: .bottom),
                type: type,
                multiplifier: 1,
                constant: -insets.bottom,
                priority: priority
            ),
            .init(
                from: .init(view: self, type: .left),
                to: .init(view: view, type: .left),
                type: type,
                multiplifier: 1,
                constant: insets.left,
                priority: priority
            ),
            .init(
                from: .init(view: self, type: .right),
                to: .init(view: view, type: .right),
                type: type,
                multiplifier: 1,
                constant: -insets.right,
                priority: priority
            )
        ]
    }

    // MARK: Vertical edges with equal constant

    /**
     Pins vertical edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.  Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinEqualVerticalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinVerticalEdges(
            to: view,
            type: .equal,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins vertical edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.  Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinLessOrEqualVerticalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinVerticalEdges(
            to: view,
            type: .lessOrEqual,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins vertical edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints.  Default is `0`.
     - Parameter priority: The priority of pin constraints. Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinGreaterOrEqualVerticalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinVerticalEdges(
            to: view,
            type: .greaterOrEqual,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins vertical edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.  Default is `.equal`.
     - Parameter constant: The constant value of pin constraints.  Default is `0`.
     - Parameter priority: The priority of pin constraints.  Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinVerticalEdges(
        to view: UIView,
        type: LayoutConstraint.`Type` = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return [
            .init(
                from: .init(view: self, type: .top),
                to: .init(view: view, type: .top),
                type: type,
                multiplifier: 1,
                constant: constant,
                priority: priority
            ),
            .init(
                from: .init(view: self, type: .bottom),
                to: .init(view: view, type: .bottom),
                type: type,
                multiplifier: 1,
                constant: -constant,
                priority: priority
            )
        ]
    }

    // MARK: Horizontal edges with equal constant

    /**
     Pins horizontal edges of view to other view with **equal** constraints .

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints.  Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinEqualHorizontalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinHorizontalEdges(
            to: view,
            type: .equal,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins horizontal edges of view to other view with **lessThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints.  Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinLessOrEqualHorizontalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinHorizontalEdges(
            to: view,
            type: .lessOrEqual,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins horizontal edges of view to other view with **greaterThanOrEqual** constraints.

     - Parameter view: The target view to pin.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints.  Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinGreaterOrEqualHorizontalEdges(
        to view: UIView,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return pinHorizontalEdges(
            to: view,
            type: .greaterOrEqual,
            constant: constant,
            priority: priority
        )
    }

    /**
     Pins horizontal edges of view to other view.

     - Parameter view: The target view to pin.
     - Parameter type: The type of constraint.  Default is `.equal`.
     - Parameter constant: The constant value of pin constraints. Default is `0`.
     - Parameter priority: The priority of pin constraints.  Default is `.standart`.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func pinHorizontalEdges(
        to view: UIView,
        type: LayoutConstraint.`Type` = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return [
            .init(
                from: .init(view: self, type: .left),
                to: .init(view: view, type: .left),
                type: type,
                multiplifier: 1,
                constant: constant,
                priority: priority
            ),
            .init(
                from: .init(view: self, type: .right),
                to: .init(view: view, type: .right),
                type: type,
                multiplifier: 1,
                constant: -constant,
                priority: priority
            )
        ]
    }
}
