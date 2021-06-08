//
//  NSLayoutAnchorable.swift
//  K1ngLayout
//
//  Created by Artem Belkov on 18.02.2021.
//

import UIKit

public protocol NSLayoutAnchorable: AnyObject {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }

    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }

    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }

    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }

    var heightAnchor: NSLayoutDimension { get }
    var widthAnchor: NSLayoutDimension { get }
}

// MARK: -

extension UILayoutGuide: NSLayoutAnchorable {}

// MARK: -

extension UIView: NSLayoutAnchorable {}
