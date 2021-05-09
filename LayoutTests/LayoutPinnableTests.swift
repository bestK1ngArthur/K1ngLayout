//
//  LayoutPinnableTests.swift
//  LayoutTests
//
//  Created by Artem Belkov on 09.05.2021.
//

@testable import Layout
import XCTest

class LayoutPinnableTests: XCTestCase {
    override func setUp() {
        view = .init()
        superview = .init()
        superview.addSubview(view)
    }

    func testAllEdgesWithConstant() throws {
        let constant: CGFloat = 8

        // Test equal constraints

        var constraints = view.pinEqualEdges(to: superview, constant: constant)

        var nsConstraints = [
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant),
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinLessOrEqualEdges(to: superview, constant: constant)

        nsConstraints = [
            view.topAnchor.constraint(lessThanOrEqualTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -constant),
            view.leftAnchor.constraint(lessThanOrEqualTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(lessThanOrEqualTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinGreaterOrEqualEdges(to: superview, constant: constant)

        nsConstraints = [
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: superview.bottomAnchor, constant: -constant),
            view.leftAnchor.constraint(greaterThanOrEqualTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(greaterThanOrEqualTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))
    }

    func testAllEdgesWithInsets() throws {
        let insets: EdgeInsets = .init(top: 1, left: 2, bottom: 3, right: 4)

        // Test equal constraints

        var constraints = view.pinEqualEdges(to: superview, insets: insets)

        var nsConstraints = [
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinLessOrEqualEdges(to: superview, insets: insets)

        nsConstraints = [
            view.topAnchor.constraint(lessThanOrEqualTo: superview.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -insets.bottom),
            view.leftAnchor.constraint(lessThanOrEqualTo: superview.leftAnchor, constant: insets.left),
            view.rightAnchor.constraint(lessThanOrEqualTo: superview.rightAnchor, constant: -insets.right)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinGreaterOrEqualEdges(to: superview, insets: insets)

        nsConstraints = [
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: superview.bottomAnchor, constant: -insets.bottom),
            view.leftAnchor.constraint(greaterThanOrEqualTo: superview.leftAnchor, constant: insets.left),
            view.rightAnchor.constraint(greaterThanOrEqualTo: superview.rightAnchor, constant: -insets.right)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))
    }

    func testVerticalEdgesWithConstant() throws {
        let constant: CGFloat = 8

        // Test equal constraints

        var constraints = view.pinEqualVerticalEdges(to: superview, constant: constant)

        var nsConstraints = [
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinLessOrEqualVerticalEdges(to: superview, constant: constant)

        nsConstraints = [
            view.topAnchor.constraint(lessThanOrEqualTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinGreaterOrEqualVerticalEdges(to: superview, constant: constant)

        nsConstraints = [
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: constant),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: superview.bottomAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))
    }

    func testHorizontalEdgesWithConstant() throws {
        let constant: CGFloat = 8

        // Test equal constraints

        var constraints = view.pinEqualHorizontalEdges(to: superview, constant: constant)

        var nsConstraints = [
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinLessOrEqualHorizontalEdges(to: superview, constant: constant)

        nsConstraints = [
            view.leftAnchor.constraint(lessThanOrEqualTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(lessThanOrEqualTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))

        // Test lessThanOrEqual constraints

        constraints = view.pinGreaterOrEqualHorizontalEdges(to: superview, constant: constant)

        nsConstraints = [
            view.leftAnchor.constraint(greaterThanOrEqualTo: superview.leftAnchor, constant: constant),
            view.rightAnchor.constraint(greaterThanOrEqualTo: superview.rightAnchor, constant: -constant)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))
    }

    private var view: UIView!
    private var superview: UIView!
}
