//
//  OnBordongView.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 13/8/23.
//

import SwiftUI
import RiveRuntime

struct OnBordongView: View {
    
    let buttton = RiveViewModel(fileName: "button")
    
    @State var showModel = false
    
    var body: some View {
        ZStack{
            
            background
            
            content.offset(y:showModel ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModel ? 0.4 : 0)
                .ignoresSafeArea()
            
            
            
            if showModel {
                SignInView(showModel: $showModel)
                // to make animation from bottom
                    .transition(.move(edge: .bottom)
                         // to make it disapper while goes
                        .combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()){
                                showModel = false
                            }
                        }label: {
                        Image(systemName: "xmark")
                        .frame(width: 36,height: 36)
                        .background(.white)
                        .mask(Circle())
                        .shadow(color: Color("Shadow"), radius: 5,x: 0,y: 3)
                        }
                            .frame(maxHeight: .infinity,alignment: .bottom)
                    )
                    .zIndex(1)
                        
            }
            
        }
    }
    
   
    var content : some View {
        VStack(alignment: .leading){
            
            Text("Learn Design & Code")
                .font(.custom("Poppins Bold", size:60,relativeTo: .largeTitle))
                .frame(width: 260,alignment: .leading)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis commodo non nisi id  tempor nunc, et ornare sem massa vel erat. Ut ut consectetur ante. Etiam a sem orci")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Spacer()
            
            buttton.view()
                .frame(width: 236,height: 64)
                .overlay(Label("Start the course",systemImage: "arrow.forward")
                    .offset(x:4,y:4)
                    .font(.headline)
                )
                .background(Color.black
                    .cornerRadius(30)
                    .blur(radius: 30)
                    .opacity(0.3)
                    .offset(y:10)
                )
                .onTapGesture {
                    buttton.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 ) {
                        withAnimation(.spring()){
                            if showModel {
                                showModel = false
                            } else {
                                showModel = true
                            }
                        }
                    }
                }
        }
        .padding()
    }
    
    var background : some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea().blur(radius: 30)
            .background(Image("Spline")
                .blur(radius: 50)
                .offset(x:200,y:100))
    }
}

struct OnBordongView_Previews: PreviewProvider {
    static var previews: some View {
        OnBordongView()
    }
}
