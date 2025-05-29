//
//  Pokemon.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation
import SwiftData

@Model
final class Pokemon: Identifiable {
    @Attribute(.unique) var id: Int
    var name: String
    var imageURL: String
    var height: Double
    var weight: Double
    var types: [PokemonTypeEntry]
    var stats: [PokemonStatEntry]
    var created: String
    
    init(
        id: Int,
        name: String,
        imageURL: String,
        height: Double,
        weight: Double,
        types: [PokemonTypeEntry],
        stats: [PokemonStatEntry]
    ) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.height = height
        self.weight = weight
        self.types = types
        self.stats = stats
        self.created = Date.now.ISO8601Format()
    }
}
