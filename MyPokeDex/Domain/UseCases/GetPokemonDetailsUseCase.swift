//
//  GetPokemonDetailsUseCase.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

final class GetPokemonDetailsUseCase {
    
    private let repository: PokeRepository
    
    init(repository: PokeRepository = PokeRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(_ id: Int) async throws -> Pokemon {
        try await repository.fetchPokemon(id: id)
    }
}
