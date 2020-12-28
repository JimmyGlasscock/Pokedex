//
//  PokemonCellView.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//

import SwiftUI

struct PokemonCellView: View {
    let pokemon: Pokemon
    
    static let colors: [String: UIColor] = [
        "normal" : UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.5),
        "fire" : UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 0.5),
        "water" : UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 0.5),
        "electric" : UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.3),
        "grass" : UIColor(red: 0.6, green: 1.0, blue: 0.6, alpha: 0.5),
        "ice" : UIColor(red: 0.0, green: 0.2, blue: 0.5, alpha: 0.2),
        "fighting" : UIColor(red: 1.0, green: 0.55, blue: 0.6, alpha: 0.5),
        "poison" : UIColor(red: 0.8, green: 0.55, blue: 1.0, alpha: 0.5),
        "ground" : UIColor(red: 0.7, green: 0.6, blue: 0.4, alpha: 0.5),
        "flying" : UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.5),
        "psychic" : UIColor(red: 1.0, green: 0.0, blue: 0.3, alpha: 0.2),
        "bug" : UIColor(red: 0.4, green: 0.8, blue: 0.0, alpha: 0.35),
        "rock" : UIColor(red: 0.7, green: 0.6, blue: 0.4, alpha: 0.5),
        "ghost" : UIColor(red: 0.2, green: 0.0, blue: 0.4, alpha: 0.3),
        "dark" : UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.35),
        "steel" : UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25),
        "dragon" : UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.5)
    ]
    
    var body: some View {
            if #available(iOS 14, *) {
                HStack(spacing: 17){
                    
                        Text(normalizePokemonNumber(id: pokemon.id))
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 35, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        //read language from settings or phone settings
                        Text(pokemon.name.english)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 180, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
        //                Spacer()
        //                    .frame(width: 15)
                    
                        //change this based on selected generation
                        Image("icons-3/"+String(pokemon.id))
                            .interpolation(.none)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.top, -10)
                        
                        //first pokemon type
                        if(!pokemon.type.isEmpty){
                            Image("type/"+String(pokemon.type[0]).lowercased())
                        }
                    
                        //Second Type or spacer
                        if(pokemon.type.count > 1){
                            Image("type/"+String(pokemon.type[1]).lowercased())
                        }else{
                            Spacer()
                                .frame(width: 32)
                        }
                            
                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40, maxHeight: 40, alignment: .leading)
                    .padding(7)
                .background(Color.init(PokemonCellView.getTypeColor(type: pokemon.type[0])))
                    .cornerRadius(7)
            }else{
                //ios 13 layout
            }
        }
    
    static func getTypeColor(type: String) -> UIColor{
        var color = UIColor.white
        
        if let newColor = colors[type.lowercased()]{
            color = newColor
        }
        
        return color
    }
    
    //prepend zeros if need be
    func normalizePokemonNumber(id: Int) -> String{
        var number = String(id)
        
        while(number.count < 3){
            number = "0"+number
        }
        
        return number
    }
    
    }

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(pokemon: defaultPokemon)
    }
}
