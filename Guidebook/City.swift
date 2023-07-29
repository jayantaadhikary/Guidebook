//
//  City.swift
//  Guidebook
//
//  Created by Jayanta Adhikary on 28/07/23.
//

import Foundation

struct City: Identifiable, Decodable {
    
    let id = UUID()
    var name: String
    var summary: String
    var imageName: String
    
    var attractions: [Attraction]
}
