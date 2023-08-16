//
//  CustomTextField.swift
//  AnimationRive
//
//  Created by Eslam Ghazy on 13/8/23.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var image : Image
    func body(content: Content) -> some View {
        content.padding(15)
            .padding(.leading)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10,style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10,style: .continuous)
                .stroke()
                .fill(.black.opacity(0.1))
            )
            .overlay(
            image
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
            )
    }
    
}

extension View{
    func customTextFeild(image:Image = Image("Logo Email")) -> some View {
        modifier(CustomTextField(image: image))
    }
}
