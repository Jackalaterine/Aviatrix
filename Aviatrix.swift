//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    func start() -> Bool {
        running = true
        return running
    }
    var author = ""
    var location = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000.0
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    
    init (authors : String){
        author = authors
    }
    
    func refuel() -> Double {
        let fuelBought = Double(maxFuel) - fuelLevel
        let price = AviatrixData()
        let cost = price.fuelPrices[location]!
        fuelCost = Double(fuelBought) * cost
        //re set our fuel tank to full
        fuelLevel = Double(maxFuel)
        return fuelBought
    }
    
    func flyTo(destination : String) {
        let data = AviatrixData()
        let distance = data.knownDistances[location]![destination]!
        distanceTraveled = distanceTraveled + distance
        location = destination
        let fuelUsed = Double(distance) * milesPerGallon
        fuelLevel = fuelLevel - Double(fuelUsed)
    }
    
    func distanceTo(target : String) -> Int {
        let distance = AviatrixData()
        return distance.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
      let locations = AviatrixData()
        return Array(locations.knownDistances.keys)
    }
}
