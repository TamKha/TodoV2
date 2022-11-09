//
//  CustomInput.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct CustomInputField: View {
    
    var imageName: String
    var placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        
            HStack{
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.white.opacity(0.4))
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }.frame(width: 300,height: 15)
            .padding()
            .background(.white.opacity(0.3))
            .foregroundColor(.white)
            .cornerRadius(30)
            .overlay(Image(systemName: "xmark.circle")
            .padding()
            .foregroundColor(.white)
            .opacity(text.isEmpty ? 0.0 : 0.7),
            alignment: .trailing)
        }
    }

struct MultiTextField: View {
    
    @State var description = ""
    
    var body: some View{
           
            VStack {
                
                TextField("", text: $description, axis: .vertical).padding()
                
            }.frame(width: 300)
            .background(.white.opacity(0.3))
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding()
        }
    }

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        //CustomInputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
        MultiTextField()
    }
}

