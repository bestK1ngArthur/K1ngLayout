//
//  LayoutAnchor.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public class LayoutAnchor {
    public weak var view: NSLayoutAnchorable?
    public let type: Type
    
    public init(view: NSLayoutAnchorable, type: Type) {
        self.view = view
        self.type = type
    }
    
    public func equal(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0
    ) -> LayoutConstraint {
        return constraint(to: anchor, type: .equal, constant: constant)
    }
    
    public func lessOrEqual(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0
    ) -> LayoutConstraint {
        return constraint(to: anchor, type: .lessOrEqual, constant: constant)
    }
    
    public func greaterOrEqual(
        to anchor: LayoutAnchor,
        constant: CGFloat = 0
    ) -> LayoutConstraint {
        return constraint(to: anchor, type: .greaterOrEqual, constant: constant)
    }
    
    private func constraint(
        to anchor: LayoutAnchor,
        type: LayoutConstraint.`Type`,
        constant: CGFloat
    ) -> LayoutConstraint {
        return .init(from: self, to: anchor, type: type, multiplifier: 1, constant: constant)
    }
}

extension LayoutAnchor {
    public enum `Type` {
        case top
        case bottom
        case left
        case right
        case vCenter
        case hCenter
        case height
        case width
        
        var isDimension: Bool {
            switch self {
            case .height, .width: return true
            default: return false
            }
        }
    }
}
