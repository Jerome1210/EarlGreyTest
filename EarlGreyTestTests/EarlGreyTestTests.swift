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
    func testBasicSelection() {
        EarlGrey().selectElementWithMatcher(grey_accessibilityID("test1")).performAction(grey_tap())
    }
    func testSufficientlyVisible() {
        EarlGrey().selectElementWithMatcher(grey_accessibilityID("test1")).assertWithMatcher(grey_sufficientlyVisible())
    }
       
}
