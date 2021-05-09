//
//  Layout.swift
//  EasyChem
//
//  Created by Artem Belkov on 18.02.2021.
//  Copyright © 2021 EasyChem. All rights reserved.
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

extension UILayoutGuide: NSLayoutAnchorable {}
extension UIView: NSLayoutAnchorable {}
