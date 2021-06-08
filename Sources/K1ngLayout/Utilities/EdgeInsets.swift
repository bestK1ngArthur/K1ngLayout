//
//  EdgeInsets.swift
//  K1ngLayout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public struct EdgeInsets {
    /// ↑ Top inset
    public let top: CGFloat

    /// ← Left inset
    public let left: CGFloat

    /// ↓ Bottom inset
    public let bottom: CGFloat

    /// → Right inset
    public let right: CGFloat

    /// Zero inset for all edges
    public static var zero: Self { .init() }

    public init(top: CGFloat = 0,
                left: CGFloat = 0,
                bottom: CGFloat = 0,
                right: CGFloat = 0)
    {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }

    public init(horizontal: CGFloat,
                vertical: CGFloat)
    {
        top = vertical
        left = horizontal
        bottom = vertical
        right = horizontal
    }

    /**
     Creates insets with equal value.

     - Parameter value: Edge inset value.
     */
    public static func all(_ value: CGFloat) -> Self {
        return .init(top: value, left: value, bottom: value, right: value)
    }

    /**
     Creates insets with equal value for horizontal edges. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func horizontal(_ value: CGFloat) -> Self {
        return .init(left: value, right: value)
    }

    /**
     Creates insets with equal value for vertical edges. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func vertical(_ value: CGFloat) -> Self {
        return .init(top: value, bottom: value)
    }

    /**
     Creates insets with value for top edge. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func top(_ value: CGFloat) -> Self {
        return .init(top: value)
    }

    /**
     Creates insets with value for bottom edge. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func bottom(_ value: CGFloat) -> Self {
        return .init(bottom: value)
    }

    /**
     Creates insets with value for left edge. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func left(_ value: CGFloat) -> Self {
        return .init(left: value)
    }

    /**
     Creates insets with value for right edge. Other edge insets will be zero.

     - Parameter value: Edge inset value.
     */
    public static func right(_ value: CGFloat) -> Self {
        return .init(right: value)
    }
}
