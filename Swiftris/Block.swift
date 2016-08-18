//
//  Block.swift
//  Swiftris
//
//  Created by Quynh Nguyen on 17/08/2016.
//  Copyright © 2016 Quynh Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

let NumberOfColours: UInt32 = 6

enum BlockColour: Int, CustomStringConvertible {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
            case .Blue:
                return "blue"
        case .Orange:
                return "orange"
        case .Purple:
                return "purple"
        case .Red:
                return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColour {
        return BlockColour(rawValue: Int(arc4random_uniform(NumberOfColours)))!
    }
}

class Block: Hashable, CustomStringConvertible {

    let colour: BlockColour
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return colour.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(colour): [\(column), \(row)]"
    }
    
    init (column: Int, row: Int, colour: BlockColour) {
        self.column = column
        self.row = row
        self.colour = colour
    }
}

func == (lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.colour.rawValue == rhs.colour.rawValue
}



