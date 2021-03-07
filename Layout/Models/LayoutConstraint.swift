//
//  LayoutConstraint.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public struct LayoutConstraint {
    public let from: LayoutAnchor
    public let to: LayoutAnchor
    public let type: Type
    public let multiplifier: CGFloat

    public var constant: CGFloat {
        didSet {
            guard constant != oldValue,
                  let view = from.view as? LayoutConstraintUpdatable else {
                return
            }
            
            view.update(constraint: self)
        }
    }
}

extension LayoutConstraint {
    public enum `Type` {
        case equal
        case lessOrEqual
        case greaterOrEqual
    }
}

extension UILayoutPriority {
    public static var standart: UILayoutPriority { .required - 1 }
}

extension UIView {
    
    public func activate(_ constraints: [LayoutConstraint], priority: UILayoutPriority = .standart) {
        
        let layoutConstraints = nsConstraints(from: constraints, with: priority)
        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension UIView {
    
    func nsConstraints(
        from constraints: [LayoutConstraint],
        with priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        
        let layoutConstraints: [NSLayoutConstraint] = constraints.compactMap { constraint in
            let layoutConstraint: NSLayoutConstraint
            
            if let fromDimension = constraint.from as? LayoutDimension,
               let toDimension = constraint.to as? LayoutDimension {
                guard let fromDimensionAnchor = nsDimension(from: fromDimension),
                      let toDimensionAnchor = nsDimension(from: toDimension) else {
                    return nil
                }
                
                layoutConstraint = nsDimensionConstraint(
                    from: fromDimensionAnchor,
                    to: toDimensionAnchor,
                    type: constraint.type,
                    multiplifier: constraint.multiplifier,
                    constant: constraint.constant
                )
                
            } else {
                guard let fromAnchor = nsAnchor(from: constraint.from),
                      let toAnchor = nsAnchor(from: constraint.to) else {
                    return nil
                }
                
                layoutConstraint = nsAnchorConstraint(
                    from: fromAnchor,
                    to: toAnchor,
                    type: constraint.type,
                    constant: constraint.constant
                )
            }
            
            layoutConstraint.priority = priority
            
            return layoutConstraint
        }
        
        return layoutConstraints
    }
    
    func nsAnchorConstraint(
        from: NSLayoutAnchor<AnyObject>,
        to: NSLayoutAnchor<AnyObject>,
        type: LayoutConstraint.`Type`,
        constant: CGFloat
    ) -> NSLayoutConstraint {
        switch type {
        case .equal:
            return from.constraint(
                equalTo: to,
                constant: constant
            )
        case .lessOrEqual:
            return from.constraint(
                lessThanOrEqualTo: to,
                constant: constant
            )
        case .greaterOrEqual:
            return from.constraint(
                greaterThanOrEqualTo: to,
                constant: constant
            )
        }
    }
    
    func nsDimensionConstraint(
        from: NSLayoutDimension,
        to: NSLayoutDimension,
        type: LayoutConstraint.`Type`,
        multiplifier: CGFloat,
        constant: CGFloat
    ) -> NSLayoutConstraint {
        if from == to, multiplifier == 1 {
            switch type {
            case .equal:
                return from.constraint(
                    equalToConstant: constant
                )
            case .lessOrEqual:
                return from.constraint(
                    lessThanOrEqualToConstant: constant
                )
            case .greaterOrEqual:
                return from.constraint(
                    greaterThanOrEqualToConstant: constant
                )
            }
        }
        
        switch type {
        case .equal:
            return from.constraint(
                equalTo: to,
                multiplier: multiplifier,
                constant: constant
            )
        case .lessOrEqual:
            return from.constraint(
                lessThanOrEqualTo: to,
                multiplier: multiplifier,
                constant: constant
            )
        case .greaterOrEqual:
            return from.constraint(
                greaterThanOrEqualTo: to,
                multiplier: multiplifier,
                constant: constant
            )
        }
    }
    
    func nsAnchor(from anchor: LayoutAnchor) -> NSLayoutAnchor<AnyObject>? {
        guard let anchors = anchor.view else {
            assertionFailure("View can't be nil")
            return nil
        }
        
        let layoutAnchor: NSObject? = {
            switch anchor.type {
            case .top: return anchors.topAnchor
            case .bottom: return anchors.bottomAnchor
            case .left: return anchors.leftAnchor
            case .right: return anchors.rightAnchor
            case .vCenter: return anchors.centerYAnchor
            case .hCenter: return anchors.centerXAnchor
            default: return nil
            }
        }()
        
        return layoutAnchor as? NSLayoutAnchor<AnyObject>
    }
    
    func nsDimension(from dimension: LayoutDimension) -> NSLayoutDimension? {
        guard let dimensions = dimension.view else {
            assertionFailure("View can't be nil")
            return nil
        }
        
        let dimensionAnchor: NSLayoutDimension? = {
            switch dimension.type {
            case .height: return dimensions.heightAnchor
            case .width: return dimensions.widthAnchor
            default: return nil
            }
        }()
        
        return dimensionAnchor
    }
}
