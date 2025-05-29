//
//  PokemonListViewModel.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import Foundation

@Observable
final class PokemonListViewModel {
    
    private(set) var pokemons: [PokemonListItem] = []
    private(set) var errorMsg = ""
    
    var isLoading = false
    var hasError = false
    var searchTerm = ""
    
    @ObservationIgnored
    private var getPokemonListUseCase: GetPokemonListUseCase!
    
    init(getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase()) {
        self.getPokemonListUseCase = getPokemonListUseCase
    }
    
    func fetchPokemons() async {
        isLoading = true
        hasError = false
        errorMsg = ""
        
        do {
            pokemons = try await getPokemonListUseCase.execute()
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            errorMsg = "We couldn't fetch the pokemons. Please try again later."
        }
    }
}
