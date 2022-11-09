//
//  PrivateTodosView.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct PrivateTodosView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    
    var body: some View {
        
        
        ZStack {
            Color(.black).ignoresSafeArea()
            
            VStack {
                Text("Private Todos").font(.title).bold().foregroundColor(.white)
                
                if let userDocument = dbConnection.userDocument {
                    
                    List() {
                        
                        ForEach(userDocument.privateTodos) {
                            todo in
                            
                            Text(todo.title)
                            
                        }
                        
                    }
                }
                
                
                Button("Hej") {
                    
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct PrivateTodosView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateTodosView(dbConnection: DatabaseConnection())
    }
}
