//
//  DatabaseConnection.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import Foundation
import Firebase

class DatabaseConnection: ObservableObject {
    
    private var db = Firestore.firestore()
    
    @Published var userDocument: UserDocument?
    
    @Published private var todoList = [TodoModel]()
    
    @Published private var task = [TaskModel]()
    
    
    @Published var userSignedIn = false
    @Published var currentUser: User?
    
    var userDocumentListener: ListenerRegistration?
  
    
    // När instans görs av klassen så körs init automatiskt
    
    init() {
        
        Auth.auth().addStateDidChangeListener {
            auth, user in
            
            if let user = user {
                //Inloggad
                self.userSignedIn = true
                self.currentUser = user
                self.ListenToDb()
                
            } else {
                //Utloggad
                self.userSignedIn = false
                self.currentUser = nil
                self.StopListeningToDb()
                
            }
        }
        
        
       
            self.todoList = [TodoModel(id: "1", title: "TodoTitle", sharedUser: [], tasks: [TaskModel(id: "1", title: "TaskTitle", description: "Description", assignedUsers: [])])]
            
            self.task = [TaskModel(id: "1", title: "TaskTitle", description: "Description", assignedUsers: [])]
        
        
        
        
    }
    
    func createPrivateTodo(todo: TodoModel){
        
        if let currentUser = currentUser {
            
            do {
                try db.collection("userData").document(currentUser.uid).updateData(["privateTodos": FieldValue.arrayUnion([Firestore.Encoder().encode(todo)])])
            } catch {
                print("Error")
            }
        }
    }
    
    func createSharedTodo(newTodo: TodoModel){
        
       // Hjälp
        
    }
    
//    func findUserById(userId: String) -> UserDocument {
//
//
//
//    }
    
    func createTask(newTask: TaskModel, todoId: String){
        
        
    }
    
//    func getTodoById(todoId: String) -> TodoModel {
//
//
//
//    }
    
    func StopListeningToDb() {
        
        if let userDocumentListener = userDocumentListener {
            userDocumentListener.remove()
        }
    }
    
    func ListenToDb() {
        
        if let currentUser = currentUser {
            
            userDocumentListener = self.db.collection("userData").document(currentUser.uid).addSnapshotListener({ snapshot, error in
                
                if let error = error {
                    print("Error occured: \(error.localizedDescription)")
                }
                
                guard let snapshot = snapshot else {return}
                
                let result = Result {
                    try snapshot.data(as: UserDocument.self)
                }
                
                switch result {
                case .success(let userData):
                    self.userDocument = userData
                    break
                case .failure(let error):
                    print("Something went wrong retrieving data: \(error.localizedDescription)")
                }
            })
            
        }
        
    }
    
    func SignOut() {
        
        do{
            try Auth.auth().signOut()
        } catch {
            print("Error signing out.")
        }
    }
    
    func SignInUser(email: String, passWord: String) {
        
        Auth.auth().signIn(withEmail: email, password: passWord) {
            authDataResult, error in
            
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            }
        }
    }
    
    func SignUpUser(email: String, passWord: String) {
        
        Auth.auth().createUser(withEmail: email, password: passWord) {
            authDataResult, error in
            
            if let error = error {
                print("Error creating account: \(error.localizedDescription)")
            }
            
            if let authDataResult = authDataResult {
                
                let newUserDocument = UserDocument(id: authDataResult.user.uid, fullName: "", userName: "", privateTodos: [], sharedTodos: [])
                
                do {
                    
                    _ = try self.db.collection("userData").document(authDataResult.user.uid).setData(from: newUserDocument)
                    
                } catch {
                    
                    print("Error")
                    
                }
            }
        }
    }
}
