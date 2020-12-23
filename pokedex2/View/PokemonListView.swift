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
    @Binding var currentPokemon: Pokemon
    
    @Binding var pokemonViewModel: PokemonViewModel
    
    init(buttonClick: Binding<Bool>, currentPokemon: Binding<Pokemon>, pokemonViewModel: Binding<PokemonViewModel>){
        self._buttonClick = buttonClick
        self._currentPokemon = currentPokemon
        self._pokemonViewModel = pokemonViewModel
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 4){
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
        }
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView(buttonClick: false)
//    }
//}
