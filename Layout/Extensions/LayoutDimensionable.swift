//
//  LayoutDimensionable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutDimensionable: AnyObject {
    /// [ Height layout dimension
    var height: LayoutDimension { get }

    /// ⎵ Width layout dimension
    var width: LayoutDimension { get }
}

// MARK: -

extension UIView: LayoutDimensionable {
    public var height: LayoutDimension { .init(view: self, type: .height) }
    public var width: LayoutDimension { .init(view: self, type: .width) }
}

// MARK: -

extension UILayoutGuide: LayoutDimensionable {
    public var height: LayoutDimension { .init(view: self, type: .height) }
    public var width: LayoutDimension { .init(view: self, type: .width) }
}
