//
//  PokemonListView.swift
//  MyPokeDex
//
//  Created by Germán Hernández del Rosario on 29/5/25.
//

import SwiftUI
import LoadingViewKit

struct PokemonListView: View {
    
    @State private var viewModel = PokemonListViewModel()
    
    var body: some View {
        LoadingViewKit(title: "Fetching...", isLoading: $viewModel.isLoading) {
            NavigationStack {
                List {
                    ForEach(viewModel.pokemons) { pokemon in
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                                image
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .background(Material.ultraThick)
                                    .cornerRadius(16)
                            } placeholder: {
                                ProgressView()
                            }

                            VStack(alignment: .leading) {
                                Text("#\(pokemon.id) \(pokemon.name.capitalized)")
                                    .font(.headline)
                            }
                        }
                    }
                }
                .navigationTitle("MyPokeDex")
                .searchable(text: $viewModel.searchTerm, prompt: "Search Pokemon by name or ID")
                .listRowSpacing(10)
                .alert(isPresented: $viewModel.hasError) {
                    Alert(title: Text("Something went wrong"), message: Text(viewModel.errorMsg))
                }
                .task {
                    await viewModel.fetchPokemons()
                }
            }
        }
    }
}

#Preview {
    PokemonListView()
}
