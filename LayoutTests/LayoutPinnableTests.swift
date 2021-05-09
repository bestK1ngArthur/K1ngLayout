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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    private var view: UIView!
    private var superview: UIView!
}
