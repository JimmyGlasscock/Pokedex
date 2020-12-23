//
//  PokemonNameTypeView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/23/20.
//

import SwiftUI

struct PokemonNameTypeView: View {
    var type: [String]
    var name: name
    
    init(name: name, type:[String]){
        self.name = name
        self.type = type
    }
    
    var body: some View {
        //Put Pokemon Number here
        //Pokemon Name
        Text(name.english)
        //Pokemon types
        HStack{
            Image("type/"+type[0].lowercased())
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 21)
            if(type.count > 1){
                Image("type/"+type[1].lowercased())
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 21)
            }
        }
    }
}

struct PokemonNameTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonNameTypeView(name: defaultPokemon.name, type: defaultPokemon.type)
    }
}
