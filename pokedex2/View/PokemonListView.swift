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
    
    var numberOfPokemon = [0, 151, 251, 386, 493, 649]
    
    init(currentPokemon: Binding<Pokemon>, pokemonViewModel: Binding<PokemonViewModel>, currentGeneration: Binding<Int>){
        self._currentPokemon = currentPokemon
        self._pokemonViewModel = pokemonViewModel
        self._currentGeneration = currentGeneration
    }
    
    var body: some View {
        NavigationView{
            //ScrollView{
                List{
                    //use list of pokemon from view model
                    ForEach(0 ..< numberOfPokemon[currentGeneration], id: \.self){ i in
                        NavigationLink(
                            destination: PokemonDetailView(currentPokemon: pokemonViewModel.PokemonList[i], currentGeneration: $currentGeneration))
                        {
                            PokemonCellView(pokemon: pokemonViewModel.PokemonList[i])
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            //}
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
