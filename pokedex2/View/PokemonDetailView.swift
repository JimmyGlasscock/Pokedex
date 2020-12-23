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
        ScrollView{
            VStack(spacing: 10){
                Button(action: {
                    withAnimation{
                        self.buttonClick.toggle()
                    }
                }){
                    Text("Back")
                }
                .frame(width: 50, height: 50)
                
                //Pokemon Image View
                Image("sprites-4/"+String(currentPokemon.id))
                    .resizable()
                    .frame(width:160, height:160)
                //Put Pokemon Number here
                //Pokemon Name
                Text(currentPokemon.name.english)
                //Pokemon types
                HStack{
                    Image("type/"+currentPokemon.type[0].lowercased())
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 21)
                    if(currentPokemon.type.count > 1){
                        Image("type/"+currentPokemon.type[1].lowercased())
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 21)
                    }
                }
            }
            .frame(alignment: .top)
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
