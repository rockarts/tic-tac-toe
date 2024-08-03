//
//  tic_tac_toeTests.swift
//  tic-tac-toeTests
//
//  Created by Steven Rockarts on 2024-08-01.
//

import XCTest
@testable import tic_tac_toe

final class tic_tac_toeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldCreateAnEmptyBoard() {
        let ticTacToe = TicTacToe()
        XCTAssertEqual(ticTacToe.isEmpty(), true)
        ticTacToe.printBoard()
    }
    
    func testCurrentPlayerShouldBeAbleToMakeAMove() {
        let ticTacToe = TicTacToe()
        let result = ticTacToe.makeMove(at: (0,0))
        XCTAssertEqual(ticTacToe.isEmpty(), false)
        XCTAssert(result)
        ticTacToe.printBoard()
    }
    
    func testCheckForAWinInARow() {
        let ticTacToe = TicTacToe()
        _ = ticTacToe.makeMove(at: (0,0))
        _ = ticTacToe.makeMove(at: (1,0))
        _ = ticTacToe.makeMove(at: (2,0))
        ticTacToe.printBoard()
        
        ticTacToe.checkWinner()
        XCTAssert(ticTacToe.winner == .x)
    }
    
    func testCheckForAWinInAColumn() {
        let ticTacToe = TicTacToe()
        _ = ticTacToe.makeMove(at: (0,0))
        _ = ticTacToe.makeMove(at: (0,1))
        _ = ticTacToe.makeMove(at: (0,2))
        ticTacToe.printBoard()
        
        ticTacToe.checkWinner()
        XCTAssert(ticTacToe.winner == .x)
    }
    
    func testCheckForAWinInADiagonal() {
        let ticTacToe = TicTacToe()
        _ = ticTacToe.makeMove(at: (0,0))
        _ = ticTacToe.makeMove(at: (1,1))
        _ = ticTacToe.makeMove(at: (2,2))
        ticTacToe.printBoard()
        
        ticTacToe.checkWinner()
        XCTAssert(ticTacToe.winner == .x)
    }
    
    func testCheckForAWinInAReverseDiagonal() {
        let ticTacToe = TicTacToe()
        _ = ticTacToe.makeMove(at: (0,2))
        _ = ticTacToe.makeMove(at: (1,1))
        _ = ticTacToe.makeMove(at: (2,0))
        ticTacToe.printBoard()
        
        ticTacToe.checkWinner()
        XCTAssert(ticTacToe.winner == .x)
    }
}
