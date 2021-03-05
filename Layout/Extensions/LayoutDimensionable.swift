//
//  LayoutDimensionable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutDimensionable: AnyObject {
    var height: LayoutDimension { get }
    var width: LayoutDimension { get }
}

extension UIView: LayoutDimensionable {
    public var height: LayoutDimension { .init(view: self, type: .height) }
    public var width: LayoutDimension { .init(view: self, type: .width) }
}

extension UILayoutGuide: LayoutDimensionable {
    public var height: LayoutDimension { .init(view: self, type: .height) }
    public var width: LayoutDimension { .init(view: self, type: .width) }
}
