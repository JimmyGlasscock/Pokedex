//
//  ContentView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @State var settingsView = false
    @State var detailView = false
    
    @State var currentGeneration = 5
    @State var currentPokemon = defaultPokemon
    @State var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        VStack{
            if self.detailView{
                PokemonDetailView(buttonClick: $detailView, currentPokemon: $currentPokemon, currentGeneration: $currentGeneration)
            }else if self.settingsView{
                SettingsView(buttonClick: $settingsView, currentGeneration: $currentGeneration)
            }else{
                PokemonListView(buttonClick: $detailView, settingsButtonClick: $settingsView, currentPokemon: $currentPokemon, pokemonViewModel: $pokemonViewModel, currentGeneration: $currentGeneration)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
