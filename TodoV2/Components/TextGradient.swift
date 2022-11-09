//
//  TextGradient.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct TextGradient: View {
    
    @State var text: String
    
    @State var fontSize: Int
    
    @State var frameHeight: Int

    var body: some View{
        
        ZStack{
            VStack{
               
                LinearGradient(colors: [Color.init(red: 255/255, green: 255/255, blue: 255/255), Color.init(red: 115/255, green: 51/255, blue: 170/255)], startPoint: .leading, endPoint: .trailing)
                    .mask(
                        // Page name
                        Text(text)
                            .font(Font.system(size: CGFloat(fontSize), weight: .thin))
                    )
            }
        }.frame(height: CGFloat(frameHeight))
          
    }
}

struct TextGradient_Previews: PreviewProvider {
    static var previews: some View {
        TextGradient(text: "Home",fontSize: 30, frameHeight: 80)
    }
}
