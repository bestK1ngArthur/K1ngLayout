//
//  LayoutSettableTests.swift
//  K1ngLayoutTests
//
//  Created by Artem Belkov on 22.09.2021.
//

@testable import K1ngLayout
import XCTest

class LayoutSettableTests: XCTestCase {
    override func setUp() {
        view = .init()
    }

    func testEqualEdges() throws {
        let constant: CGFloat = 8

        // Test equal edges

        let constraints = view.setEqualEdges(constant)

        var nsConstraints = [
            view.widthAnchor.constraint(equalToConstant: constant),
            view.widthAnchor.constraint(equalTo: view.heightAnchor)
        ]

        nsConstraints.setPriority(.standart)

        XCTAssert(compare(lhs: LayoutConstraint.nsConstraints(from: constraints),
                          rhs: nsConstraints))
    }

    private var view: UIView!
}
