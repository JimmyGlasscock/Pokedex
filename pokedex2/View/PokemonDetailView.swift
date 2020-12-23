//
//  PokemonDetailView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/22/20.
//

import SwiftUI

struct PokemonDetailView: View {
    @Binding var currentPokemon: Pokemon
    @Binding var currentGeneration: Int
    @Binding var buttonClick: Bool
    
    init(buttonClick: Binding<Bool>,currentPokemon: Binding<Pokemon>, currentGeneration: Binding<Int>) {
        self._buttonClick = buttonClick
        self._currentPokemon = currentPokemon
        self._currentGeneration = currentGeneration
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .center, spacing: 10){
                    //Pokemon Image View
                    Image("sprites-"+String(currentGeneration)+"/"+String(currentPokemon.id))
                        .interpolation(.none)
                        .resizable()
                        .frame(width:160, height:160)
                    
                    PokemonNameTypeView(name: currentPokemon.name, type: currentPokemon.type)
                }
                .frame(alignment: .top)
            }
            .navigationBarItems(leading:
                HStack{
                    Button(action: {
                    withAnimation{
                        self.buttonClick.toggle()
                    }
                    }){
                        Text("Back")
                }
            })
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    @State var ourPokemon = defaultPokemon
//
//    static var previews: some View {
//        PokemonDetailView(currentPokemon: $ourPokemon)
//    }
//}
