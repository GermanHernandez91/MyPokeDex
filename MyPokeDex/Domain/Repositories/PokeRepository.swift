//
//  PokeRepository.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

protocol PokeRepository {
    func fetchPokemons(limit: Int) async throws -> [PokemonListItem]
    func fetchPokemon(id: Int) async throws -> Pokemon
}
