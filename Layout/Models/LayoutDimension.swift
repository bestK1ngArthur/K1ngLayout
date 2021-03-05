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

    public func equal(constant: CGFloat = 0) -> LayoutConstraint {
        return equal(to: self, constant: constant)
    }
    
    public func lessOrEqual(constant: CGFloat = 0) -> LayoutConstraint {
        return lessOrEqual(to: self, constant: constant)
    }
    
    public func greaterOrEqual(constant: CGFloat = 0) -> LayoutConstraint {
        return greaterOrEqual(to: self, constant: constant)
    }
    
    public func equal(to dimension: LayoutDimension, constant: CGFloat = 0, multiplifier: CGFloat = 1) -> LayoutConstraint {
        return constraint(to: dimension, type: .equal, constant: constant, multiplifier: multiplifier)
    }
    
    public func lessOrEqual(to dimension: LayoutDimension, constant: CGFloat = 0, multiplifier: CGFloat = 1) -> LayoutConstraint {
        return constraint(to: dimension, type: .lessOrEqual, constant: constant, multiplifier: multiplifier)
    }
    
    public func greaterOrEqual(to dimension: LayoutDimension, constant: CGFloat = 0, multiplifier: CGFloat = 1) -> LayoutConstraint {
        return constraint(to: dimension, type: .greaterOrEqual, constant: constant, multiplifier: multiplifier)
    }
    
    private func constraint(to dimension: LayoutDimension, type: LayoutConstraint.`Type`, constant: CGFloat, multiplifier: CGFloat) -> LayoutConstraint {
        return .init(from: self, to: dimension, type: type, multiplifier: multiplifier, constant: constant)
    }
}
