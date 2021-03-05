//
//  LayoutConstraintUpdatable.swift
//  Layout
//
//  Created by Artem Belkov on 05.03.2021.
//

import UIKit

protocol LayoutConstraintUpdatable {
    func update(constraint: LayoutConstraint)
}

extension UILayoutGuide: LayoutConstraintUpdatable {
    func update(constraint: LayoutConstraint) {
        fatalError("Not implemented yet")
    }
}

extension UIView: LayoutConstraintUpdatable {
    func update(constraint: LayoutConstraint) {
        guard let fromAnchor = nsAnchor(from: constraint.from),
              let toAnchor = nsAnchor(from: constraint.to),
              let nsConstraint = constraints.first(where: { current in
                if #available(iOS 10.0, *) {
                    return current.firstAnchor == fromAnchor
                        && current.secondAnchor == toAnchor
                } else {
                    fatalError("Can't update constraint")
                }
              }) else {
            return
        }
        
        nsConstraint.constant = constraint.constant
    }
}
