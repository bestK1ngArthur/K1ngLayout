//
//  EdgeInsets.swift
//  Layout
//
//  Created by Artem Belkov on 03.03.2021.
//

import UIKit

public struct EdgeInsets {
    public let top: CGFloat
    public let left: CGFloat
    public let bottom: CGFloat
    public let right: CGFloat

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

    public static func all(_ value: CGFloat) -> Self {
        return .init(top: value, left: value, bottom: value, right: value)
    }

    public static func horizontal(_ value: CGFloat) -> Self {
        return .init(left: value, right: value)
    }

    public static func vertical(_ value: CGFloat) -> Self {
        return .init(top: value, bottom: value)
    }

    public static func top(_ value: CGFloat) -> Self {
        return .init(top: value)
    }

    public static func bottom(_ value: CGFloat) -> Self {
        return .init(bottom: value)
    }

    public static func left(_ value: CGFloat) -> Self {
        return .init(left: value)
    }

    public static func right(_ value: CGFloat) -> Self {
        return .init(right: value)
    }
}
