//
//  scoreboardTests.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-02.
//

import XCTest
@testable import tic_tac_toe

final class scoreBoardTests: XCTestCase {
    
    func testShouldIncrementScoreForX() {
        let scoreboard = Scoreboard()
        scoreboard.incrementScore(for: .x)
        XCTAssertEqual(scoreboard.xWins, 1)
        XCTAssertEqual(scoreboard.oWins, 0)
        XCTAssertEqual(scoreboard.ties, 0)
    }
    
    func testShouldIncrementScoreForO() {
        let scoreboard = Scoreboard()
        scoreboard.incrementScore(for: .o)
        XCTAssertEqual(scoreboard.xWins, 0)
        XCTAssertEqual(scoreboard.oWins, 1)
        XCTAssertEqual(scoreboard.ties, 0)
    }
    
    func testShouldIncrementScoreForATie() {
        let scoreboard = Scoreboard()
        scoreboard.incrementScore(for: .none)
        XCTAssertEqual(scoreboard.xWins, 0)
        XCTAssertEqual(scoreboard.oWins, 0)
        XCTAssertEqual(scoreboard.ties, 1)
    }
    
    func testShouldResetScores() {
        let scoreboard = Scoreboard()
        scoreboard.incrementScore(for: .x)
        scoreboard.incrementScore(for: .o)
        scoreboard.incrementScore(for: .none)
        XCTAssertEqual(scoreboard.xWins, 1)
        XCTAssertEqual(scoreboard.oWins, 1)
        XCTAssertEqual(scoreboard.ties, 1)
        scoreboard.resetScores()
        XCTAssertEqual(scoreboard.xWins, 0)
        XCTAssertEqual(scoreboard.oWins, 0)
        XCTAssertEqual(scoreboard.ties, 0)
    }
    
}
