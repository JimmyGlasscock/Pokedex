//
//  SettingsView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/23/20.
//

import SwiftUI

struct SettingsView: View {
    @Binding var currentGeneration: Int
    @Binding var buttonClick: Bool
    
    var generations = [1,2,3,4,5]
    
    init(buttonClick: Binding<Bool>, currentGeneration: Binding<Int>){
        self._buttonClick = buttonClick
        self._currentGeneration = currentGeneration
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $currentGeneration, label: Text("Generation"), content: {
                        ForEach(generations, id: \.self){ generation in
                            Text(String(generation))
                            }
                        })                        }
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

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
