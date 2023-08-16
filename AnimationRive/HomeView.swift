//
//  HomeView.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 16/8/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            ScrollView{
                content
            }
        }
    }
    
    var content : some View {
        VStack(spacing: 0){
            
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,20)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(courses){ course in
                        VCard(course: course)
                    }
                }.padding(20)
                .padding(.bottom,10)
            }
            
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal,20)
                .frame(maxWidth: .infinity,alignment: .bottomLeading)
            VStack(spacing: 20){
                ForEach(courseSections) { item in
                    HCard(section: item)
                }
                
            }.padding(20)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
