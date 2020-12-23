//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//

import Foundation

class Pokemon: Decodable, Identifiable{
    //Misc Info
    var id: Int
    //name is an array with support for other languages
    var name: name
    var type = [String]()
    
    //Base stats
    var base: base
    
    //evolutions
    
    //pokedex entry
    
    //moves
    
    init(id:Int, name: name, type:[String], base:base){
        self.id = id
        self.name = name
        self.type = type
        
        self.base = base
    }
}

struct name: Codable{
    var english: String
    var japanese: String
    var chinese: String
    var french: String
}

struct base: Codable{
    let HP: Int
    let Attack: Int
    let Defense: Int
    let SpAttack: Int
    let SpDefense: Int
    let Speed: Int
    
    private enum CodingKeys : String, CodingKey {
        case HP, Attack, Defense, SpAttack = "Sp. Attack", SpDefense = "Sp. Defense", Speed
    }
}

//default empty pokemon
let defaultName: name = name.init(english: "", japanese: "", chinese: "", french: "")
let defaultBase: base = base.init(HP: 0, Attack: 0, Defense: 0, SpAttack: 0, SpDefense: 0, Speed: 0)
let defaultType = [""]
let defaultPokemon = Pokemon.init(id: 1, name: defaultName, type: defaultType, base: defaultBase)
