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
    
    @State var currentPokemon = defaultPokemon
    @State var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        VStack{
            if self.detailView{
                PokemonDetailView(buttonClick: $detailView, currentPokemon: $currentPokemon)
            }else if self.settingsView{
                //call settings view
            }else{
                PokemonListView(buttonClick: $detailView, currentPokemon: $currentPokemon, pokemonViewModel: $pokemonViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
