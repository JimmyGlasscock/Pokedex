//
//  PokemonDetailView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/22/20.
//

import SwiftUI

struct PokemonDetailView: View {
    @Binding var currentPokemon: Pokemon
    @Binding var buttonClick: Bool
    
    init(buttonClick: Binding<Bool>,currentPokemon: Binding<Pokemon>) {
        self._buttonClick = buttonClick
        self._currentPokemon = currentPokemon
    }
    
    var body: some View {
        VStack{
            Button(action: {
                withAnimation{
                    self.buttonClick.toggle()
                }
            }){
                Text("<")
            }
            .frame(width: 50, height: 50)
            
            //Pokemon Image View
            Image("sprites-4/"+String(currentPokemon.id))
                .resizable()
                .frame(width:160, height:160)
            //Pokemon Name, Type, Number View
            Text(currentPokemon.name.english)
        }
        .frame(alignment: .top)
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    @State var ourPokemon = defaultPokemon
//
//    static var previews: some View {
//        PokemonDetailView(currentPokemon: $ourPokemon)
//    }
//}
