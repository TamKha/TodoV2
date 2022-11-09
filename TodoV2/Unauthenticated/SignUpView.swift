//
//  SignUpView.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    
    @State var email = ""
    @State var userName = ""
    @State var passWord = ""
    @State var confirmPassWord = ""

    var body: some View {
        
        ZStack {
            
            CustomGradient().ignoresSafeArea()
            
            VStack() {
                TextGradient(text: "TODO", fontSize: 60,frameHeight: 60)
                
                VStack(alignment:.leading) {
                    Text("Email:").foregroundColor(.white).padding(.leading)
                    CustomInputField(imageName: "envelope", placeholderText: "", text: $email).padding(.bottom)
                    
                    Text("Username:").foregroundColor(.white).padding(.leading)
                    CustomInputField(imageName: "person", placeholderText: "", text: $userName).padding(.bottom)
                    
                    Text("Password:").foregroundColor(.white).padding(.leading)
                    CustomInputField(imageName: "lock", placeholderText: "",isSecureField: true, text: $passWord).padding(.bottom)
                    
                    Text("Confirm Password:").foregroundColor(.white).padding(.leading)
                    CustomInputField(imageName: "lock", placeholderText: "",isSecureField: true, text: $confirmPassWord)
                         
                }.padding().padding()

                VStack{
                   
                    Button {
                        
                        if email != "" && userName != "" && passWord != "" && confirmPassWord != "" && passWord == confirmPassWord {
                            
                            dbConnection.SignUpUser(email: email, passWord: passWord)
                        }
                        
                    } label: {
                        Text("Sign Up")
                            .padding(.horizontal,30)
                            .padding(.vertical)
                            .background(Color(cgColor: CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)))
                            .foregroundColor(.orange)
                            .cornerRadius(25)
                            .bold()
                    }

                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(dbConnection: DatabaseConnection())
    }
}

