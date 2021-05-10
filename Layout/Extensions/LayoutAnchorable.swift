//
//  LayoutAnchorable.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public protocol LayoutAnchorable: AnyObject {
    /// ↑ Top layout anchor
    var top: LayoutAnchor { get }

    /// ↓ Bottom layout anchor
    var bottom: LayoutAnchor { get }

    /// ← Left layout anchor
    var left: LayoutAnchor { get }

    /// → Right layout anchor
    var right: LayoutAnchor { get }

    /// ← Leading layout anchor
    var leading: LayoutAnchor { get }

    /// → Trailing layout anchor
    var trailing: LayoutAnchor { get }

    /// ↕ Vertical center layout anchor
    var vCenter: LayoutAnchor { get }

    /// ↔ Horizontal center layout anchor
    var hCenter: LayoutAnchor { get }
}

extension UIView: LayoutAnchorable {
    public var top: LayoutAnchor { .init(view: self, type: .top) }
    public var bottom: LayoutAnchor { .init(view: self, type: .bottom) }

    public var left: LayoutAnchor { .init(view: self, type: .left) }
    public var right: LayoutAnchor { .init(view: self, type: .right) }

    public var leading: LayoutAnchor { .init(view: self, type: .leading) }
    public var trailing: LayoutAnchor { .init(view: self, type: .trailing) }

    public var vCenter: LayoutAnchor { .init(view: self, type: .vCenter) }
    public var hCenter: LayoutAnchor { .init(view: self, type: .hCenter) }
}

extension UILayoutGuide: LayoutAnchorable {
    public var top: LayoutAnchor { .init(view: self, type: .top) }
    public var bottom: LayoutAnchor { .init(view: self, type: .bottom) }

    public var left: LayoutAnchor { .init(view: self, type: .left) }
    public var right: LayoutAnchor { .init(view: self, type: .right) }

    public var leading: LayoutAnchor { .init(view: self, type: .leading) }
    public var trailing: LayoutAnchor { .init(view: self, type: .trailing) }

    public var vCenter: LayoutAnchor { .init(view: self, type: .vCenter) }
    public var hCenter: LayoutAnchor { .init(view: self, type: .hCenter) }
}
