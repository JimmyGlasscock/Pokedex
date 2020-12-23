//
//  ContentView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @State var currentGeneration = 5
    @State var currentPokemon = defaultPokemon
    @State var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        VStack{
                PokemonListView(currentPokemon: $currentPokemon, pokemonViewModel: $pokemonViewModel, currentGeneration: $currentGeneration)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
