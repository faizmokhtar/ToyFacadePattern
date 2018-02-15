//
//  PirateShip.swift
//  ToyFacadePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class PirateShip {
  struct ShipLocation {
    let northSouth: Int
    let eastWest: Int
  }

  var currentPosition: ShipLocation
  var movementQueue = DispatchQueue(label: "shipQ")

  init() {
    currentPosition = ShipLocation(northSouth: 5, eastWest: 5)
  }

  func moveToLocation(location: ShipLocation, callback:@escaping (ShipLocation) -> Void) {
    movementQueue.async {
      self.currentPosition = location
      callback(self.currentPosition)
    }
  }
}
