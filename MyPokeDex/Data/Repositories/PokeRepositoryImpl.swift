//
//  PokeRepositoryImpl.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

final class PokeRepositoryImpl: PokeRepository {
    
    private let apiService: PokeService
    
    init(apiService: PokeService = PokeServiceImpl()) {
        self.apiService = apiService
    }
    
    func fetchPokemons(limit: Int) async throws -> [PokemonListItem] {
        try await apiService
            .fetchAllPokemon(limit: limit)
            .results
    }
    
    func fetchPokemon(id: Int) async throws -> Pokemon {
        try await apiService
            .fetchPokemonDetail(id: id)
            .mapFromResponse(id: id)
    }
}
