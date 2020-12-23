//
//  PokemonDetailView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/22/20.
//

import SwiftUI

struct PokemonDetailView: View {
    var currentPokemon: Pokemon
    var color: UIColor
    @Binding var currentGeneration: Int
    
    init(currentPokemon: Pokemon, currentGeneration: Binding<Int>) {
        self.currentPokemon = currentPokemon
        self._currentGeneration = currentGeneration
        self.color = PokemonCellView.getTypeColor(type: currentPokemon.type[0])
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 10){
                //Pokemon Image View
                HStack{
                    Image("sprites-"+String(currentGeneration)+"/"+String(currentPokemon.id))
                        .interpolation(.none)
                        .resizable()
                        .frame(width:160, height:160)
                }
                .frame(width:190, height:190)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.init(color), lineWidth: 10)
                    )
                
                PokemonNameTypeView(name: currentPokemon.name, type: currentPokemon.type)
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
