//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//

import SwiftUI

struct PokemonListView: View {
    var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 4){
                    //use list of pokemon from view model
                    ForEach(pokemonViewModel.PokemonList){ Pokemon in
                        PokemonCellView(pokemon: Pokemon)
                    }
                }
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
