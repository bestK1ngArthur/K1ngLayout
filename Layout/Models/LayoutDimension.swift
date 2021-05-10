//
//  LayoutDimension.swift
//  EasyChem
//
//  Created by Artem Belkov on 03.03.2021.
//  Copyright © 2021 EasyChem. All rights reserved.
//

import UIKit

public class LayoutDimension: LayoutAnchor {
    override init(view: NSLayoutAnchorable, type: Type) {
        guard type.isDimension else {
            fatalError("Need to init with dimension type")
        }

        super.init(view: view, type: type)
    }

    /**
     Creates constraint with **equal** type.

     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func equal(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return equal(
            to: self,
            constant: constant,
            priority: priority
        )
    }

    /**
     Creates constraint with **lessOrEqual** type.

     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func lessOrEqual(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return lessOrEqual(
            to: self,
            constant: constant,
            priority: priority
        )
    }

    /**
     Creates constraint with **greaterOrEqual** type.

     - Parameter constant: The constant value. Default is `0`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func greaterOrEqual(
        constant: CGFloat = 0,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return greaterOrEqual(
            to: self,
            constant: constant,
            priority: priority
        )
    }

    /**
     Creates constraint with **equal** type.

     - Parameter dimension: The target dimension.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter multiplifier: The multiplifier value. Default is `1`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func equal(
        to dimension: LayoutDimension,
        constant: CGFloat = 0,
        multiplifier: CGFloat = 1,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: dimension,
            type: .equal,
            constant: constant,
            multiplifier: multiplifier,
            priority: priority
        )
    }

    /**
     Creates constraint with **lessOrEqual** type.

     - Parameter dimension: The target dimension.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter multiplifier: The multiplifier value. Default is `1`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func lessOrEqual(
        to dimension: LayoutDimension,
        constant: CGFloat = 0,
        multiplifier: CGFloat = 1,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: dimension,
            type: .lessOrEqual,
            constant: constant,
            multiplifier: multiplifier,
            priority: priority
        )
    }

    /**
     Creates constraint with **greaterOrEqual** type.

     - Parameter dimension: The target dimension.
     - Parameter constant: The constant value. Default is `0`.
     - Parameter multiplifier: The multiplifier value. Default is `1`.
     - Parameter priority: The priority of constraint.  Default is `.standart`.

     - Returns: A layout constraint.
     */
    public func greaterOrEqual(
        to dimension: LayoutDimension,
        constant: CGFloat = 0,
        multiplifier: CGFloat = 1,
        priority: UILayoutPriority = .standart
    ) -> LayoutConstraint {
        return constraint(
            to: dimension,
            type: .greaterOrEqual,
            constant: constant,
            multiplifier: multiplifier,
            priority: priority
        )
    }

    private func constraint(
        to dimension: LayoutDimension,
        type: LayoutConstraint.`Type`,
        constant: CGFloat,
        multiplifier: CGFloat,
        priority: UILayoutPriority
    ) -> LayoutConstraint {
        return .init(
            from: self,
            to: dimension,
            type: type,
            multiplifier: multiplifier,
            constant: constant,
            priority: priority
        )
    }
}
