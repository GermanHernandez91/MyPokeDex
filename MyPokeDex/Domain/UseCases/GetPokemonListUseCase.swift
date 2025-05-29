//
//  GetPokemonListUseCase.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

final class GetPokemonListUseCase {
    
    private let repository: PokeRepository
    
    init(repository: PokeRepository = PokeRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [PokemonListItem] {
        try await repository.fetchPokemons(limit: 150)
    }
}
