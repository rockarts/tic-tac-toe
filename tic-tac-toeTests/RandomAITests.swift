//
//  RandomAITests.swift
//  tic-tac-toeTests
//
//  Created by Steven Rockarts on 2024-08-05.
//

import XCTest
@testable import tic_tac_toe

final class RandomAITests: XCTestCase {

    func testMakeMove() throws {
        let game = TicTacToe()
        let ai = RandomAI(game: game)
        let move = ai.makeMove()!
        XCTAssert(move.0 >= 0 && move.0 <= 2)
        XCTAssert(move.1 >= 0 && move.1 <= 2)
    }
}
