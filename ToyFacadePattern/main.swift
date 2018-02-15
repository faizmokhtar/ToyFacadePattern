//
//  main.swift
//  ToyFacadePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

let map = TreasureMap()
let ship = PirateShip()
let crew = PirateCrew()

let treasureLocation = map.findTreasures(type: .galleon)

// convert from map to ship coordinates
let sequence: [Character] = ["A", "B", "C", "D", "E", "F", "G"]
let eastWestPos = sequence.index{ $0 == treasureLocation.gridLetter }
let shipTarget = PirateShip.ShipLocation(northSouth: Int(treasureLocation.gridNumber), eastWest: eastWestPos!)

ship.moveToLocation(location: shipTarget) { location in
  crew.performAction(action: .attackShip, callback: { prize in
    print("Prize: \(prize) piece of eight")
  })
}

FileHandle.standardInput.availableData
