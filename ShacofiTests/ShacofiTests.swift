//
//  ShacofiTests.swift
//  ShacofiTests
//
//  Created by Daniel Kostovetsky on 1/8/18.
//  Copyright © 2018 Daniel Kostovetsky. All rights reserved.
//

import XCTest
@testable import Shacofi

class ShacofiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTileGetImage() {
        XCTAssert(Tile.blank.getImage() == #imageLiteral(resourceName: "Blank"))
        XCTAssert(Tile.tile(Tile.Color.Cyan, Tile.Fill.Checkered,
                            Tile.Shape.Circle, false).getImage() == #imageLiteral(resourceName: "CyanCheckeredCircle"))
        XCTAssert(Tile.tile(Tile.Color.Magenta, Tile.Fill.Solid,
                            Tile.Shape.Triangle, true).getImage() == #imageLiteral(resourceName: "MagentaSolidTriangle*"))
    }
    
    func testTileEquality() {
        XCTAssert(Tile.blank == Tile.blank)
        XCTAssert(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, false).toggleSelected()! ==
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, true))
        XCTAssert(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, true).toggleSelected()! ==
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, true))
        XCTAssertFalse(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, false).toggleSelected()! ==
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Empty,
                      Tile.Shape.Square, false))
        XCTAssertFalse(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, true).toggleSelected()! ==
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Square, true))
        XCTAssertFalse(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, false).toggleSelected()! ==
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true))
    }
    
    func testTileToggleSelected() {
        XCTAssert(Tile.blank.toggleSelected() == nil)
        XCTAssert(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, false).toggleSelected()! ==
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Square, true))
        XCTAssert(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true).toggleSelected()! ==
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, false))
    }
    
    func testIsTrio() {
        XCTAssert(Tile.isTrio(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true)))
        XCTAssert(Tile.isTrio(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Circle, true)))
        XCTAssert(Tile.isTrio(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Empty,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Checkered,
                      Tile.Shape.Circle, true)))
        XCTAssert(Tile.isTrio(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Square, true),
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Checkered,
                      Tile.Shape.Circle, true)))
        XCTAssertFalse(Tile.isTrio(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Square, true),
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Checkered,
                      Tile.Shape.Circle, true)))
        XCTAssertFalse(Tile.isTrio(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Square, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Checkered,
                      Tile.Shape.Triangle, true)))
        XCTAssertFalse(Tile.isTrio(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Triangle, true)))
        XCTAssertFalse(Tile.isTrio(
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Empty,
                      Tile.Shape.Triangle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Solid,
                      Tile.Shape.Triangle, true)))
        XCTAssertFalse(Tile.isTrio(
            Tile.tile(Tile.Color.Cyan, Tile.Fill.Solid,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Magenta, Tile.Fill.Empty,
                      Tile.Shape.Circle, true),
            Tile.tile(Tile.Color.Yellow, Tile.Fill.Checkered,
                      Tile.Shape.Circle, false)))
    }
    
}
