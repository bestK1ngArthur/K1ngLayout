//
//  LayoutPinnable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutPinnable {
    // MARK: All edges with equal constant

    func pinEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: All edges with insets

    func pinEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinEdges(to view: UIView, type: LayoutConstraint.`Type`, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: Vertical edges with equal constant

    func pinEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualVerticalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinVerticalEdges(to view: UIView, type: LayoutConstraint.`Type`, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]

    // MARK: Horizontal edges with equal constant

    func pinEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualHorizontalEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinHorizontalEdges(to view: UIView, type: LayoutConstraint.`Type`, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
}

extension UIView: LayoutPinnable {
    // MARK: All edges with equal constant

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

    public func pinEdges(
        to view: UIView,
        type: LayoutConstraint.`Type` = .equal,
        insets: EdgeInsets = .zero,
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
