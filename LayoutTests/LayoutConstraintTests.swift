//
//  LayoutConstraintTests.swift
//  LayoutTests
//
//  Created by Artem Belkov on 05.03.2021.
//

@testable import Layout
import XCTest

class LayoutConstraintTests: XCTestCase {
    override func setUp() {
        view = .init()
        superview = .init()
        superview.addSubview(view)
    }

    func testSimpleAnchors() {
        // Test edges constraints

        let constraints = [
            view.top.equal(to: superview.top),
            view.bottom.equal(to: superview.bottom),
            view.left.equal(to: superview.left),
            view.right.equal(to: superview.right),
            view.leading.equal(to: superview.leading),
            view.trailing.equal(to: superview.trailing)
        ]

        var nsConstraints = [
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.leftAnchor.constraint(equalTo: superview.leftAnchor),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test edges constraints with constant

        let constraintsWithConstant = [
            view.top.equal(to: superview.top, constant: 1),
            view.bottom.equal(to: superview.bottom, constant: 2),
            view.left.equal(to: superview.left, constant: 3),
            view.right.equal(to: superview.right, constant: 4),
            view.leading.equal(to: superview.leading, constant: 5),
            view.trailing.equal(to: superview.trailing, constant: 6)
        ]

        var nsConstraintsWithConstant = [
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 1),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 2),
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 3),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 4),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 5),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 6)
        ]

        nsConstraintsWithConstant.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraintsWithConstant),
                          rhs: nsConstraintsWithConstant))
    }

    func testSimpleDimensions() {
        // Test dimensions constraints

        let constraints = [
            view.height.equal(to: superview.height),
            view.width.equal(to: superview.width)
        ]

        var nsConstraints = [
            view.heightAnchor.constraint(equalTo: superview.heightAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test dimensions constraints with multiplifier

        let constraintsWithMultiplifier = [
            view.height.equal(to: superview.height, multiplifier: 1),
            view.width.equal(to: superview.width, multiplifier: 2)
        ]

        var nsConstraintsWithMultiplifier = [
            view.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 1),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 2)
        ]

        nsConstraintsWithMultiplifier.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraintsWithMultiplifier),
                          rhs: nsConstraintsWithMultiplifier))

        // Test dimensions constraints with constant

        let constraintsWithConstant = [
            view.height.equal(constant: 1),
            view.width.equal(constant: 2)
        ]

        var nsConstraintsWithConstant = [
            view.heightAnchor.constraint(equalToConstant: 1),
            view.widthAnchor.constraint(equalToConstant: 2)
        ]

        nsConstraintsWithConstant.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraintsWithConstant),
                          rhs: nsConstraintsWithConstant))
    }

    private var view: UIView!
    private var superview: UIView!
}
