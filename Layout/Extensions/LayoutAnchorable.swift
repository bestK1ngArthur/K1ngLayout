//
//  LayoutAnchorable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutAnchorable: AnyObject {
    var top: LayoutAnchor { get }
    var bottom: LayoutAnchor { get }
    var left: LayoutAnchor { get }
    var right: LayoutAnchor { get }
    
    var vCenter: LayoutAnchor { get }
    var hCenter: LayoutAnchor { get }
}

extension UIView: LayoutAnchorable {
    public var top: LayoutAnchor { .init(view: self, type: .top) }
    public var bottom: LayoutAnchor { .init(view: self, type: .bottom) }
    public var left: LayoutAnchor { .init(view: self, type: .left) }
    public var right: LayoutAnchor { .init(view: self, type: .right) }
    
    public var vCenter: LayoutAnchor { .init(view: self, type: .vCenter) }
    public var hCenter: LayoutAnchor { .init(view: self, type: .hCenter) }
}

extension UILayoutGuide: LayoutAnchorable {
    public var top: LayoutAnchor { .init(view: self, type: .top) }
    public var bottom: LayoutAnchor { .init(view: self, type: .bottom) }
    public var left: LayoutAnchor { .init(view: self, type: .left) }
    public var right: LayoutAnchor { .init(view: self, type: .right) }
    
    public var vCenter: LayoutAnchor { .init(view: self, type: .vCenter) }
    public var hCenter: LayoutAnchor { .init(view: self, type: .hCenter) }
}
