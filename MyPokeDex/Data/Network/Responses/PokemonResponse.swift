//
//  PokemonResponse.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

struct PokemonDetail: Codable {
    let name: String
    let height: Double
    let weight: Double
    let types: [PokemonTypeEntry]
    let stats: [PokemonStatEntry]
}

struct PokemonTypeEntry: Codable {
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
}

struct PokemonStatEntry: Codable {
    let baseStat: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct Stat: Codable {
    let name: String
}

extension Stat {
    var displayName: String {
        switch name {
        case "hp": return "❤️ HP"
        case "attack": return "⚔️ ATK"
        case "defense": return "🛡 DEF"
        case "speed": return "⚡ SPD"
        default: return name.capitalized
        }
    }
}

extension PokemonDetail {
    
    func mapFromResponse(id: Int) -> Pokemon {
        .init(
            id: id,
            name: name,
            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png",
            height: height,
            weight: weight,
            types: types,
            stats: stats)
    }
}
