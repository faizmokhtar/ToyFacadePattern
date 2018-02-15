//
//  main.swift
//  ToyFacadePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

let facade = PirateFacade()
let prize = facade.getTreasure(type: .ship)
if prize != nil {
  print("Prize: \(prize!) pieces of eight")
}
