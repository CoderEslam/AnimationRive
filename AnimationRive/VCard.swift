//
//  VCard.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 16/8/23.
//

import SwiftUI

struct VCard: View {
    var course: Course
    
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 8){
            
            Text(course.title)
                .customFont(.title2)
                .frame(maxWidth: 170,alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .customFont(.subheadline)
                .opacity(0.7)
            Text(course.caption.uppercased())
                .font(.footnote)
            Spacer()
            HStack{
                ForEach(Array([4,5,6].shuffled().enumerated()),id:\.offset){index , num in
                    Image("Avatar \(num)")
                        .resizable()
                        .frame(width: 44,height: 44)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20 ))
                }
                
            }
        }.padding(30)
            .frame(width: 260,height: 310)
            .background(.linearGradient(colors: [course.color,course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomLeading))
            .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: course.color.opacity(0.3), radius: 8,x: 0,y: 10)
            .overlay{
                course.image.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                    .padding(20)
            }
        
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(course: courses[1])
    }
}
