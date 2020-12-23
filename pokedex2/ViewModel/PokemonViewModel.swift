//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Jimmy Glasscock on 12/21/20.
//
//  This class will initialize the list of pokemon and deserialize the JSON

import Foundation

class PokemonViewModel{
    
    var PokemonList = [Pokemon]()
    
    init(){
        fillPokemonList()
    }
    
    func fillPokemonList(){
       //if gen 1 is selected, only populate to 151
        
        //if gen 2 is selected, only populate to 251
        
        //if gen 3 is selected, only populate to 386
        
        //if gen 4 is selected, only populate to 493
        
        //if gen 5 is selected, only populate to 649
        
        //ensures getJSONData isnt nil - unwraps optional
        if let jsondata = getJSONData(){
            //populate pokemonList
            parseJSONToPokemonList(jsonData: jsondata)
        }
    }
    
    func getJSONData() -> Data?{
        do{
            if let filePath = Bundle.main.path(forResource: "pokedex", ofType: "json"), let jsonData = try String(contentsOfFile: filePath).data(using: .utf8) {
                return jsonData
            }
        }catch{
            print(error)
        }
        return nil
    }
    
    func parseJSONToPokemonList(jsonData: Data){
        do{
            let decodedData: [Pokemon] = try JSONDecoder().decode([Pokemon].self, from: jsonData)
            
            PokemonList = decodedData
        }catch{
            print(error)
        }
    }
}
