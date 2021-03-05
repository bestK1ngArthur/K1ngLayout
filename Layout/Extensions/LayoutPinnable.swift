//
//  LayoutPinnable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutPinnable {
    func pinEqualEdges(to view: UIView, constant: CGFloat) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, constant: CGFloat) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, constant: CGFloat) -> [LayoutConstraint]
    
    func pinEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint]
    func pinLessOrEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint]
    func pinGreaterOrEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint]
    
    func pinEdges(to view: UIView, type: LayoutConstraint.`Type`, insets: EdgeInsets) -> [LayoutConstraint]
}

extension UIView: LayoutPinnable {

    public func pinEqualEdges(to view: UIView, constant: CGFloat = 0) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .equal, insets: .init(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    public func pinLessOrEqualEdges(to view: UIView, constant: CGFloat = 0) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .lessOrEqual, insets: .init(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    public func pinGreaterOrEqualEdges(to view: UIView, constant: CGFloat = 0) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .greaterOrEqual, insets: .init(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    public func pinEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .equal, insets: insets)
    }
    
    public func pinLessOrEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .lessOrEqual, insets: insets)
    }
    
    public func pinGreaterOrEqualEdges(to view: UIView, insets: EdgeInsets) -> [LayoutConstraint] {
        return pinEdges(to: view, type: .greaterOrEqual, insets: insets)
    }
    
    public func pinEdges(to view: UIView, type: LayoutConstraint.`Type`, insets: EdgeInsets = .zero) -> [LayoutConstraint] {
        return [
            .init(
                from: .init(view: self, type: .top),
                to: .init(view: view, type: .top),
                type: type,
                multiplifier: 1,
                constant: insets.top
            ),
            .init(
                from: .init(view: self, type: .bottom),
                to: .init(view: view, type: .bottom),
                type: type,
                multiplifier: 1,
                constant: insets.bottom
            ),
            .init(
                from: .init(view: self, type: .left),
                to: .init(view: view, type: .left),
                type: type,
                multiplifier: 1,
                constant: insets.left
            ),
            .init(
                from: .init(view: self, type: .right),
                to: .init(view: view, type: .right),
                type: type,
                multiplifier: 1,
                constant: insets.right
            )
        ]
    }
}
