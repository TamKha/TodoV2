//
//  CustomGradient.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct CustomGradient: View {
    var body: some View {
        
        LinearGradient(colors: [Color.init(red: 12/255, green: 26/255, blue: 100/255), Color.init(red: 121/255, green: 52/255, blue: 174/255)], startPoint: .leading, endPoint: .trailing)
        
    }
}

struct CustomGradient_Previews: PreviewProvider {
    static var previews: some View {
        CustomGradient()
    }
}
