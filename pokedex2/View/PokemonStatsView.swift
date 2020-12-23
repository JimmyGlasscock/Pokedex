//
//  PokemonStatsView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/23/20.
//

import SwiftUI

struct PokemonStatsView: View {
    var base: base
    
    var colors = [
        UIColor.init(red: 0.0, green: 1.0, blue: 0.5, alpha: 0.5),
        UIColor.init(red: 0.0, green: 1.0, blue: 0.5, alpha: 0.9),
        UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.4),
        UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.8),
        UIColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3),
        UIColor.init(red: 0.0, green: 0.2, blue: 0.8, alpha: 0.7),
        UIColor.init(red: 0.5, green: 0.0, blue: 0.6, alpha: 0.3),
        UIColor.init(red: 0.5, green: 0.2, blue: 0.6, alpha: 0.7),
        UIColor.init(red: 0.5, green: 0.5, blue: 0.6, alpha: 0.3),
        UIColor.init(red: 0.5, green: 0.5, blue: 0.6, alpha: 0.7),
        UIColor.init(red: 0.9, green: 0.9, blue: 0.0, alpha: 0.3),
        UIColor.init(red: 0.9, green: 0.9, blue: 0.0, alpha: 0.7)
    ]
    
    init(base: base){
        self.base = base
    }
    
    var body: some View {
        HStack{
            VStack(spacing: 15){
                StatBarView(stat: base.HP, name: "HP", colorOne: colors[0], colorTwo: colors[1])
                StatBarView(stat: base.Attack, name: "Attack", colorOne: colors[2], colorTwo: colors[3])
                StatBarView(stat: base.Defense, name: "Defense", colorOne: colors[4], colorTwo: colors[5])
                StatBarView(stat: base.SpAttack, name: "Sp Attack", colorOne: colors[6], colorTwo: colors[7])
                StatBarView(stat: base.SpDefense, name: "Sp Defense", colorOne: colors[8], colorTwo: colors[9])
                StatBarView(stat: base.Speed, name: "Speed", colorOne: colors[10], colorTwo: colors[11])
            }
        }
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView(base: defaultPokemon.base)
    }
}
