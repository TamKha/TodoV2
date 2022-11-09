//
//  UserDocument.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import Foundation
import FirebaseFirestoreSwift

struct UserDocument: Codable, Identifiable {
    
    var id: String
    var fullName: String
    var userName: String
    var privateTodos: [TodoModel]
    var sharedTodos: [String]
    
}
