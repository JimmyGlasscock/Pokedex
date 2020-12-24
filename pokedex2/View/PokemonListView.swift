//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//

import SwiftUI

struct PokemonListView: View {
    @Binding var currentPokemon: Pokemon
    @Binding var currentGeneration: Int
    
    @Binding var pokemonViewModel: PokemonViewModel
    
    init(currentPokemon: Binding<Pokemon>, pokemonViewModel: Binding<PokemonViewModel>, currentGeneration: Binding<Int>){
        self._currentPokemon = currentPokemon
        self._pokemonViewModel = pokemonViewModel
        self._currentGeneration = currentGeneration
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    //use list of pokemon from view model
                    ForEach(pokemonViewModel.PokemonList){ Pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(currentPokemon: Pokemon, currentGeneration: $currentGeneration))
                        {
                            PokemonCellView(pokemon: Pokemon)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarItems(trailing:
                HStack(spacing: 25){
                    NavigationLink(destination: FavoritesView()){
                        Image("system-icons/star")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: CaughtPokemonView()){
                        Image("system-icons/pokeball")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: SettingsView(currentGeneration: $currentGeneration)){
                        Image("system-icons/setting")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 25, height: 25)
                    }
                }
            )
        }
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView(buttonClick: false)
//    }
//}
