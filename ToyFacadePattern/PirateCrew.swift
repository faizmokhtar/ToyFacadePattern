//
//  PirateCrew.swift
//  ToyFacadePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class PirateCrew {
  let workQueue = DispatchQueue(label: "crewWorkQ")

  enum Actions {
    case attackShip
    case digForGold
    case diveForJewels
  }

  func performAction(action: Actions, callback: @escaping (Int) -> Void) {
    workQueue.async {
      var prizeValue = 0
      switch action {
      case .attackShip:
        prizeValue = 10000
      case .digForGold:
        prizeValue = 5000
      case .diveForJewels:
        prizeValue = 1000
      }
      callback(prizeValue)
    }
  }
}
