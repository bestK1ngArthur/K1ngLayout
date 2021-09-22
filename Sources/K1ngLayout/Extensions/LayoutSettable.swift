//
//  LayoutSettable.swift
//  K1ngLayout
//
//  Created by Artem Belkov on 22.09.2021.
//

import UIKit

public protocol LayoutSettable {
    /**
     Set edges of view with **width** and **height**  equal constraint with constant value.

     - Parameter constant: The constant value of set constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    func setEqualEdges(_ constant: CGFloat, priority: UILayoutPriority) -> [LayoutConstraint]
}

extension UIView: LayoutSettable {
    /**
     Set edges of view with **width** and **height**  equal constraint with constant value.

     - Parameter constant: The constant value of set constraints.
     - Parameter priority: The priority of pin constraints.

     - Returns: An array of layout constraints to `activate()`.
     */
    public func setEqualEdges(
        _ constant: CGFloat,
        priority: UILayoutPriority = .standart
    ) -> [LayoutConstraint] {
        return [
            width.equal(constant: constant, priority: priority),
            width.equal(to: height, priority: priority)
        ]
    }
}
