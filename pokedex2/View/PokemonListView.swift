//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//

import SwiftUI

struct PokemonListView: View {
    @State var moveToPokemonDetail = false
    @Binding var buttonClick: Bool
    @Binding var settingsButtonClick: Bool
    @Binding var currentPokemon: Pokemon
    @Binding var currentGeneration: Int
    
    @Binding var pokemonViewModel: PokemonViewModel
    
    init(buttonClick: Binding<Bool>, settingsButtonClick: Binding<Bool>, currentPokemon: Binding<Pokemon>, pokemonViewModel: Binding<PokemonViewModel>, currentGeneration: Binding<Int>){
        self._buttonClick = buttonClick
        self._settingsButtonClick = settingsButtonClick
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
                        Button(action: {
                                withAnimation{
                                    self.buttonClick.toggle()
                                    currentPokemon = Pokemon
                                }
                            
                        }){
                            PokemonCellView(pokemon: Pokemon)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarItems(trailing:
                HStack{
                    Button(action: {
                    withAnimation{
                        self.settingsButtonClick.toggle()
                    }
                    }){
                        Text("Settings")
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
