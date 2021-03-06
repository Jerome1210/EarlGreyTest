//
//  EarlGreyTestTests.swift
//  EarlGreyTestTests
//
//  Created by Lee on 2016/5/13.
//  Copyright © 2016年 Lee. All rights reserved.
//

import XCTest
@testable import EarlGreyTest

class EarlGreyTestTests: XCTestCase {
    func testBasicSelectionAndVisible() {
        EarlGrey().selectElementWithMatcher(grey_accessibilityID("test1"))
            .performAction(grey_tap())
            .assertWithMatcher(grey_sufficientlyVisible())
    }
    func testSearchTableview() {
        EarlGrey().selectElementWithMatcher(grey_accessibilityID("title 49"))
            .usingSearchAction(grey_scrollInDirection(.Down, 150),
                               onElementWithMatcher:grey_accessibilityID("table"))
            .performAction(grey_tap())
    }
    
}
