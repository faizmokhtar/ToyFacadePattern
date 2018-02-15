//
//  Facade.swift
//  ToyFacadePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

enum TreasureTypes {
  case ship
  case buried
  case sunken
}

class PirateFacade {
  let map = TreasureMap()
  let ship = PirateShip()
  let crew = PirateCrew()

  func getTreasure(type: TreasureTypes) -> Int? {
    var prizeAmount: Int?
    var treasureMapType: TreasureMap.Treasures
    var crewWorkType: PirateCrew.Actions

    switch type {
    case .ship:
      treasureMapType = .galleon
      crewWorkType = .attackShip
    case .buried:
      treasureMapType = .buriedGold
      crewWorkType = .digForGold
    case .sunken:
      treasureMapType = .sunkenJewels
      crewWorkType = .diveForJewels
    }

    let treasureLocation = map.findTreasures(type: treasureMapType)
    let sequence: [Character] = ["A", "B", "C", "D", "E", "F", "G"]
    let eastWestPos = sequence.index{ $0 == treasureLocation.gridLetter }
    let shipTarget = PirateShip.ShipLocation(northSouth: Int(treasureLocation.gridNumber), eastWest: eastWestPos!)

    let semaphore = DispatchSemaphore(value: 0)

    ship.moveToLocation(location: shipTarget) { location in
      self.crew.performAction(action: crewWorkType, callback: { prize in
        prizeAmount = prize
        semaphore.signal()
      })
    }

    _ = semaphore.wait(timeout: .distantFuture)
    return prizeAmount
  }
}
