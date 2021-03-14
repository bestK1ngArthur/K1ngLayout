//
//  LayoutPinnable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutPinnable {
    func pinEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
    
    func pinEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
    
    func pinEdges(to view: UIView, type: LayoutConstraint.`Type`, insets: EdgeInsets, priority: UILayoutPriority) -> [LayoutConstraint]
}

extension UIView: LayoutPinnable {

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
        type: LayoutConstraint.`Type`,
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
}
