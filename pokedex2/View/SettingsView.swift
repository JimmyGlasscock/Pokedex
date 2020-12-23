//
//  SettingsView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/23/20.
//

import SwiftUI

struct SettingsView: View {
    @Binding var currentGeneration: Int
    
    var generations = [1,2,3,4,5]
    
    init(currentGeneration: Binding<Int>){
        self._currentGeneration = currentGeneration
    }
    
    var body: some View {
        Form {
            Picker(selection: $currentGeneration, label: Text("Generation"), content: {
                ForEach(generations, id: \.self){ generation in
                    Text(String(generation))
                    }
                })
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(currentGeneration: $currentGeneration)
//    }
//}
