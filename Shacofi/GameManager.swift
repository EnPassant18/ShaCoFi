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
        case Cyan = 0, Magenta = 1, Yellow = 2
    }
    
    enum Fill: Int {
        case Empty = 0, Checkered = 1, Solid = 2
    }
    
    enum Shape: Int {
        case Square = 0, Circle = 1, Triangle = 2
    }
    
    case blank
    case tile(Color, Fill, Shape, Bool)
    
    // Returns the image associated with a tile
    func getImage() -> UIImage {
        switch self {
        case .blank:
            return #imageLiteral(resourceName: "Blank")
        case let .tile(color, fill, shape, selected):
            if selected {
                return UIImage(named: "\(color)\(fill)\(shape)*")!
            } else {
                return UIImage(named: "\(color)\(fill)\(shape)")!
            }
            
        }
    }
    
    // Returns a new Tile.tile with the Bool value negated
    // Does nothing for a Tile.blank
    func toggleSelected() -> Tile? {
        switch self {
        case let .tile(color, fill, shape, selected):
            return Tile.tile(color, fill, shape, !selected)
        default:
            return nil
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
        switch (tile1, tile2, tile3) {
        case (.tile(let color1, let fill1, let shape1, true),
              .tile(let color2, let fill2, let shape2, true),
              .tile(let color3, let fill3, let shape3, true)):
            let correctColors =
                ((color1 == color2) && (color2 == color3)) ||
                ((color1 != color2) && (color2 != color3) && (color1 != color3))
            let correctFills =
                ((fill1 == fill2) && (fill2 == fill3)) ||
                ((fill1 != fill2) && (fill2 != fill3) && (fill1 != fill3))
            let correctShapes =
                ((shape1 == shape2) && (shape2 == shape3)) ||
                ((shape1 != shape2) && (shape2 != shape3) && (shape1 != shape3))
            return correctColors && correctFills && correctShapes
        default:
            return false
        }
    }
}


class Game {
    
    var outlets: [[UIButton]]
    var scoreLabel: UILabel
    var selected: [(Int, Int)] = []
    var score = 0
    var paused = false
    var spawnDelay: Double = 0
    var board: [[Tile]] = [
        [Tile.blank, Tile.blank, Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank, Tile.blank, Tile.blank],
        [Tile.blank, Tile.blank, Tile.blank, Tile.blank, Tile.blank]]
    
    init(outlets: [[UIButton]], scoreLabel: UILabel) {
        self.outlets = outlets
        self.scoreLabel = scoreLabel
        spawn()
        spawn()
        spawn()
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                                 block: { _ in
                                    self.spawnDelay += (Double(self.score)/100.0 + 0.05)
                                    print(self.spawnDelay)
                                    if self.spawnDelay >= 1 {
                                        self.spawnDelay = 0
                                        self.spawn()
                                    }
        })
    }
    
    func updateDisplay() {
        for col in [0, 1, 2] {
            for row in [0, 1, 2, 3, 4] {
                outlets[col][row].setImage(board[col][row].getImage(),
                                           for: .normal)
            }
        }
    }
    
    func _getColumnLength(col: Int) -> Int {
        for row in [0, 1, 2, 3, 4] {
            if board[col][row] == Tile.blank {
                return row
            }
        }
        return 5
    }
    
    // Spawns three random tiles on the lowest blank row
    func spawn() {
        func spawnSingle() -> Tile {
            let color = Tile.Color(rawValue: Int(arc4random_uniform(3)))!
            let fill = Tile.Fill(rawValue: Int(arc4random_uniform(3)))!
            let shape = Tile.Shape(rawValue: Int(arc4random_uniform(3)))!
            return Tile.tile(color, fill, shape, false)
        }
        let insertRow = _getColumnLength(col: 0)
        switch insertRow {
        case 0...4:
            board[0][insertRow] = spawnSingle()
            board[1][insertRow] = spawnSingle()
            board[2][insertRow] = spawnSingle()
            updateDisplay()
        default:
            print("you lose") // STUB
        }
    }
    
    /* Called when a user presses on a tile. If the tile is blank,
    does nothing. If the tile is unselected, highlights it and records
    the selection. If the tile is already selected, unhighlights it
    and records the deselection. Also, if three tiles are now selected,
    calls the _onThreeSelected method. */
    func toggle(row: Int, col: Int) {
        switch board[col][row] {
        case Tile.tile(let color, let fill, let shape, true):
            board[col][row] = Tile.tile(color, fill, shape, false)
            updateDisplay()
            selected = selected.filter { $0 != (col, row) }
        case Tile.tile(let color, let fill, let shape, false):
            board[col][row] = Tile.tile(color, fill, shape, true)
            updateDisplay()
            selected.append((col, row))
            if selected.count == 3 {
                _onThreeSelected()
            }
        default:
            break
        }
    }
    
    func _onThreeSelected() {
        /* After a trio is deleted, determines if the board's columns
        are of equal length, and if not, moves tiles to equalize them. */
        func rebalance() {
            // Moves a tile from one board position to another
            func move(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
                board[toCol][toRow] = board[fromCol][fromRow]
                board[fromCol][fromRow] = Tile.blank
            }
            for col in [0, 1, 2] {
                for row in [1, 2, 3, 4] {
                    if !(board[col][row] == Tile.blank) && board[col][row - 1] == Tile.blank {
                        move(fromRow: row, fromCol: col, toRow: _getColumnLength(col: col), toCol: col)
                    }
                }
            }
            let col1Length = _getColumnLength(col: 0)
            let col2Length = _getColumnLength(col: 1)
            let col3Length = _getColumnLength(col: 2)
            if (col1Length != col2Length) && (col2Length != col3Length) && (col1Length != col3Length) {
                switch max(col1Length, col2Length, col3Length) {
                case col1Length:
                    if col2Length > col3Length {
                        move(fromRow: col1Length - 1, fromCol: 0,
                             toRow: col3Length, toCol: 2)
                    } else {
                        move(fromRow: col1Length - 1, fromCol: 0,
                             toRow: col2Length, toCol: 1)
                    }
                case col2Length:
                    if col1Length > col3Length {
                        move(fromRow: col2Length - 1, fromCol: 1,
                             toRow: col3Length, toCol: 2)
                    } else {
                        move(fromRow: col2Length - 1, fromCol: 1,
                             toRow: col1Length, toCol: 0)
                    }
                default:
                    if col1Length > col2Length {
                        move(fromRow: col3Length - 1, fromCol: 2,
                             toRow: col2Length, toCol: 1)
                    } else {
                        move(fromRow: col3Length - 1, fromCol: 2,
                             toRow: col1Length, toCol: 0)
                    }
                }
            } else if (col1Length == col2Length) && (col2Length == col3Length) {
                ()
            } else {
                switch min(col1Length, col2Length, col3Length) {
                case col1Length:
                    move(fromRow: col3Length - 1, fromCol: 2,
                         toRow: col1Length, toCol: 0)
                    move(fromRow: col2Length - 1, fromCol: 1,
                         toRow: col1Length + 1, toCol: 0)
                case col2Length:
                    move(fromRow: col3Length - 1, fromCol: 2,
                         toRow: col2Length, toCol: 1)
                    move(fromRow: col1Length - 1, fromCol: 0,
                         toRow: col2Length + 1, toCol: 1)
                default:
                    move(fromRow: col1Length - 1, fromCol: 0,
                         toRow: col3Length, toCol: 2)
                    move(fromRow: col2Length - 1, fromCol: 1,
                         toRow: col3Length + 1, toCol: 2)
                }
            }
            
        }
        if Tile.isTrio(board[selected[0].0][selected[0].1],
                       board[selected[1].0][selected[1].1],
                       board[selected[2].0][selected[2].1]) {
            board[selected[0].0][selected[0].1] = Tile.blank
            board[selected[1].0][selected[1].1] = Tile.blank
            board[selected[2].0][selected[2].1] = Tile.blank
            selected = []
            score += 1
            scoreLabel.text = "\(score)"
            rebalance()
            if _getColumnLength(col: 0) == 2 {
                spawn()
                spawnDelay = 0
            }
            updateDisplay()
        } else {
            board[selected[0].0][selected[0].1] =
                board[selected[0].0][selected[0].1].toggleSelected()!
            board[selected[1].0][selected[1].1] =
                board[selected[1].0][selected[1].1].toggleSelected()!
            board[selected[2].0][selected[2].1] =
                board[selected[2].0][selected[2].1].toggleSelected()!
            selected = []
            updateDisplay()
        }
    }
}
