//
//  GameManager.swift
//  Shacofi
//
//  Created by Daniel Kostovetsky on 1/13/18.
//  Copyright © 2018 Daniel Kostovetsky. All rights reserved.
//

import UIKit

enum Tile {
    
    enum Color: Int {
        case red = 0, green = 1, blue = 2
    }
    
    enum Fill: Int {
        case empty = 0, checkered = 1, solid = 2
    }
    
    enum Shape: Int {
        case square = 0, circle = 1, triangle = 2
    }
    
    case blank
    case tile(Color, Fill, Shape, Bool)
    
    // Returns the image associated with a tile
    func getImage() -> UIImage {
        switch self {
        case .blank:
            return #imageLiteral(resourceName: "Blank")
        case .tile(let color, let fill, let shape, let selected):
            if selected {
                return UIImage(named: "\(color)\(fill)\(shape)*")!
            } else {
                return UIImage(named: "\(color)\(fill)\(shape)")!
            }
            
        }
    }
    
    static func ==(_ tile1: Tile, _ tile2: Tile) -> Bool {
        switch (tile1, tile2) {
        case (.blank, .blank):
            return true
        case (.tile(let color1, let fill1, let shape1, _),
              .tile(let color2, let fill2, let shape2, _)):
            return color1 == color2 && shape1 == shape2 && fill1 == fill2
        default:
            return false
        }
    }
    
    static func isTrio(_ tile1: Tile, _ tile2: Tile, _ tile3: Tile) -> Bool {
        return true //STUB
    }
}


class Game {
    
    var board: [[Tile]]
    
    init() {
        board = [
        [Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank]]
    }
    
    // Spawns three random tiles on the lowest blank row
    func spawn() {
        func spawnSingle() -> Tile {
            let color = Tile.Color(rawValue: Int(arc4random_uniform(3)))!
            let fill = Tile.Fill(rawValue: Int(arc4random_uniform(3)))!
            let shape = Tile.Shape(rawValue: Int(arc4random_uniform(3)))!
            return Tile.tile(color, fill, shape, false)
        }
        var insertRow: Int!
        determineInsertRow: for row in [1, 2, 3, 4, 5] {
            if board[row][0] == Tile.blank {
                insertRow = row
                break determineInsertRow
            }
        }
        if let validRow = insertRow {
            board[validRow] = [spawnSingle(), spawnSingle(), spawnSingle()]
        } else {
            print("you lose") // STUB
        }
    }
    
    func select(row: Int, col: Int) {
        
    }
}
