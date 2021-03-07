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
        if let fromDimension = constraint.from as? LayoutDimension,
           let toDimension = constraint.to as? LayoutDimension,
           let nsFromDimension = nsDimension(from: fromDimension),
           let nsToDimension = nsDimension(from: toDimension),
           let nsConstraint = constraints.first(where: { current in
            if #available(iOS 10.0, *) {
                return current.firstAnchor == nsFromDimension
                    && current.secondAnchor == ((nsFromDimension == nsToDimension) ? nil : nsToDimension)
            } else {
                fatalError("Can't update constraint")
            }
          }) {
            nsConstraint.constant = constraint.constant
            return
        }
        
        guard let nsFromAnchor = nsAnchor(from: constraint.from),
              let nsToAnchor = nsAnchor(from: constraint.to),
              let nsConstraint = constraints.first(where: { current in
                if #available(iOS 10.0, *) {
                    return current.firstAnchor == nsFromAnchor
                        && current.secondAnchor == nsToAnchor
                } else {
                    fatalError("Can't update constraint")
                }
              }) else {
            return
        }
        
        nsConstraint.constant = constraint.constant
    }
}
