//
//  ContentView.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dbConnection = DatabaseConnection()
    
    var body: some View {

   
        if dbConnection.userSignedIn {
            MainPageView()
        } else {
            NavigationStack {
                SignInView(dbConnection: dbConnection)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
