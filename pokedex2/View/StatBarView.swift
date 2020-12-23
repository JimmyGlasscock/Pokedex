//
//  StatBarView.swift
//  pokedex2
//
//  Created by Jimmy Glasscock on 12/23/20.
//

import SwiftUI

struct StatBarView: View {
    
    var stat = 0
    var name = ""
    var colorOne: UIColor
    var colorTwo: UIColor
    
    init(stat: Int, name: String, colorOne: UIColor, colorTwo: UIColor){
        self.stat = stat
        self.name = name
        self.colorOne = colorOne
        self.colorTwo = colorTwo
    }
    
    var body: some View {
        HStack(spacing: 20){
            Text(name)
                .frame(width: 90)
            
            ZStack(alignment: .leading) {
                Rectangle().frame(width: 255/2 , height: 12)
                    .opacity(0.3)
                    .foregroundColor(Color.init(colorOne))
                
                Rectangle().frame(width: CGFloat(stat/2), height: 12)
                    .foregroundColor(Color.init(colorTwo))
            }.cornerRadius(45.0)
            
            Text(String(stat))
        }
    }
}

//struct StatBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatBarView()
//    }
//}
