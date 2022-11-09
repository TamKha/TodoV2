//
//  CustomButton.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI



// Hjälp - funkar ej 
struct WhiteButton: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color(cgColor: CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)))
            .foregroundColor(.orange)
            .cornerRadius(25)
            .bold()
    }
}

struct OrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(.orange)
            .cornerRadius(25)
            .foregroundColor(.white)
            .bold()
    }
}

