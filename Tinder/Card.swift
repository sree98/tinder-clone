//
//  Card.swift
//  Tinder
//
//  Created by Sreekuttan Sudarsanan on 12/30/20.
//

import Foundation

struct Card : Hashable, CustomStringConvertible{
    let id : Int
    let img: String
    var name: String
    var state: String
    var description: String
    
    static var example: Card {
        Card(id:1, img: "yosemite", name: "Yosemite", state: "California", description: "Yosemite features sheer granite cliffs, exceptionally tall waterfalls, and old-growth forests at a unique intersection of geology and hydrology. Half Dome and El Capitan rise from the park's centerpiece, the glacier-carved Yosemite Valley, and from its vertical walls drop Yosemite Falls, one of North America's tallest waterfalls at 2,425 feet (739 m) high. Three giant sequoia groves, along with a pristine wilderness in the heart of the Sierra Nevada, are home to a wide variety of rare plant and animal species.")
    }
}
