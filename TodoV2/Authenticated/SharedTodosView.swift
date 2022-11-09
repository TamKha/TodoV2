//
//  SharedTodosView.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct SharedTodosView: View {
    var body: some View {
        ZStack {
            Color(.red).ignoresSafeArea()
            
            VStack {
                Text("Shared Todos").font(.title).bold().foregroundColor(.white)
                
                Button("Hej") {
                    
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct SharedTodosView_Previews: PreviewProvider {
    static var previews: some View {
        SharedTodosView()
    }
}
