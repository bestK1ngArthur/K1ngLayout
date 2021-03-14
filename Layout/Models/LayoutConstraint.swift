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
            guard constant != oldValue else { return }
            nsConstraint?.constant = constant
        }
    }
    
    public let priority: UILayoutPriority
    
    internal var nsConstraint: NSLayoutConstraint?
    
    init(
        from: LayoutAnchor,
        to: LayoutAnchor,
        type: Type,
        multiplifier: CGFloat,
        constant: CGFloat,
        priority: UILayoutPriority
    ) {
        self.from = from
        self.to = to
        self.type = type
        self.multiplifier = multiplifier
        self.constant = constant
        self.priority = priority
        
        generateNSConstraint()
    }
    
    private mutating func generateNSConstraint() {
        if let fromDimension = from as? LayoutDimension,
           let toDimension = to as? LayoutDimension {
            guard let fromDimensionAnchor = nsDimension(from: fromDimension),
                  let toDimensionAnchor = nsDimension(from: toDimension) else {
                fatalError("Can't find dimension anchor")
            }
            
            nsConstraint = nsDimensionConstraint(
                from: fromDimensionAnchor,
                to: toDimensionAnchor,
                type: type,
                multiplifier: multiplifier,
                constant: constant
            )
            
        } else {
            guard let fromAnchor = nsAnchor(from: from),
                  let toAnchor = nsAnchor(from: to) else {
                fatalError("Can't find anchor")
            }
            
            nsConstraint = nsAnchorConstraint(
                from: fromAnchor,
                to: toAnchor,
                type: type,
                constant: constant
            )
        }
        
        nsConstraint?.priority = priority
    }
    
    private func nsAnchorConstraint(
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
    
    private func nsDimensionConstraint(
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
    
    private func nsAnchor(from anchor: LayoutAnchor) -> NSLayoutAnchor<AnyObject>? {
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
    
    private func nsDimension(from dimension: LayoutDimension) -> NSLayoutDimension? {
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
    
    public func activate(_ constraints: [LayoutConstraint]) {
        NSLayoutConstraint.activate(nsConstraints(from: constraints))
    }
    
    internal func nsConstraints(from constraints: [LayoutConstraint]) -> [NSLayoutConstraint] {
        return constraints.compactMap(\.nsConstraint)
    }
}
