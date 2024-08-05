//
//  AppSchemeSwitcherTests.swift
//  tic-tac-toeTests
//
//  Created by Steven Rockarts on 2024-08-05.
//

import XCTest
import SwiftUI

@testable import tic_tac_toe

final class AppSchemeSwitcherTests: XCTestCase {
    
    override func setUp() async throws {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    func testInitWithNoSavedScheme() {
        let switcher = AppSchemeSwitcher()
        XCTAssertEqual(switcher.current.name, "Cherry Blossom", "Default scheme should be cherry blossom")
    }
    
    func testShouldSwitchTheme() {
        let switcher = AppSchemeSwitcher()
        XCTAssertEqual(switcher.current.name, "Cherry Blossom")
        switcher.current = .mountains
        XCTAssertEqual(switcher.current.name, "Mountains")
    }
}
