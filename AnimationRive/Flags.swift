//
//  Flags.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 25/5/24.
//

import SwiftUI

struct Flags: View {
    var body: some View {
        HStack{
            
            Image("i1")
                .resizable()
                .frame(width: 40,height: 40)
            VStack{
                Text("Plan de\nRecuperacion,\nTransformacion\ny Resiliencia")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                    .bold()
            }.font(.system(size: 8))
            Image("i2").resizable()
                .frame(width: 40,height: 40)
            VStack{
                Text("Ciudad Autonoma").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                HStack{
                    Text("de")
                    Text("Ceuta")
                        .bold()
                        .font(.system(size: 12))
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
            }.font(.system(size: 8))
            Image("i3").resizable()
                .frame(width: 40,height: 40)
            VStack{
                Text("Funded by")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                    .bold()
                Text("the European Union")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                    .bold()
                Text("NextGenerationEU")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
            }.font(.system(size: 7))
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

#Preview {
    Flags()
}
