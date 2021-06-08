//
//  NSLayoutConstraint+Comparable.swift
//  K1ngLayoutTests
//
//  Created by Artem Belkov on 09.05.2021.
//

import UIKit

func compare(lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {
    return lhs.firstAnchor == rhs.firstAnchor
        && lhs.secondAnchor == rhs.secondAnchor
        && lhs.relation == rhs.relation
        && lhs.multiplier == rhs.multiplier
        && lhs.constant == rhs.constant
        && lhs.priority == rhs.priority
}

func compare(lhs: [NSLayoutConstraint], rhs: [NSLayoutConstraint]) -> Bool {
    guard lhs.count == rhs.count else { return false }

    return zip(lhs, rhs).reduce(true) { result, constraints in
        result && compare(lhs: constraints.0, rhs: constraints.1)
    }
}

extension Array where Element == NSLayoutConstraint {
    mutating func setPriority(_ priority: UILayoutPriority) {
        forEach { element in
            element.priority = priority
        }
    }
}
