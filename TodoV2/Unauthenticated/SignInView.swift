//
//  SignInView.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    
    @State var email = ""
    @State var passWord = ""
    
    var body: some View {
        
        ZStack{
            
            CustomGradient().ignoresSafeArea()
            
            VStack() {
                
                TextGradient(text: "TODO", fontSize: 60, frameHeight: 60)
                
                VStack(alignment:.leading) {
                    Text("Email:").foregroundColor(.white).padding(.leading)
                    CustomInputField(imageName: "envelope", placeholderText: "", text: $email).padding(.bottom)
                    
                    Text("Password:").foregroundColor(.white).padding(.leading)
                    
                    CustomInputField(imageName: "lock", placeholderText: "", isSecureField: true, text: $passWord)
                    
                    HStack {
                        Spacer()
                        Text("Forgot password?").foregroundColor(.white).opacity(0.4).padding(.trailing)
                    }
                }.padding().padding()
 
                VStack{
                    
                    Button {
                        
                        if email != "" && passWord != "" {
                            
                            dbConnection.SignInUser(email: email, passWord: passWord)
                            
                        }
                        
                        
                    } label: {
                        Text("Sign In").padding(.horizontal,30)
                            .padding(.vertical)
                            .background(.orange)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .bold()
                    }

                    
                    HStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.4))
                            .frame(width: 30, height: 1)
                        Text("Or")
                            .foregroundColor(.white)
                            .opacity(0.4)
                        Rectangle()
                            .fill(Color.white.opacity(0.4))
                            .frame(width: 30, height: 1)
                    }
                    
                    NavigationLink {
                        SignUpView(dbConnection: dbConnection)
                    } label: {
                        Text("Sign Up")
                            .padding()
                            .padding(.horizontal,10)
                            .background(.white.opacity(0.3)).foregroundColor(.orange)
                            .cornerRadius(30)
                    }
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(dbConnection: DatabaseConnection())
    }
}
