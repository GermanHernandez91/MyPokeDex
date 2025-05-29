//
//  PokeService.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

protocol PokeService {
    func fetchAllPokemon(limit: Int) async throws -> PokemonListResponse
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetail
}

final class PokeServiceImpl: PokeService {

    func fetchAllPokemon(limit: Int) async throws -> PokemonListResponse {
        try await NetworkClient.Request(
            url: Constants.baseURL,
            method: .get,
            headers: ["limit": limit.description]
        ).run()
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetail {
        try await NetworkClient.Request(
            url: "\(Constants.baseURL)/\(id)",
            method: .get
        ).run()
    }
}
