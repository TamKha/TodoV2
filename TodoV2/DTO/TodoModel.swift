//
//  TodoModel.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import Foundation

struct TodoModel: Codable, Identifiable {
    
    var id: String
    var title: String
    var sharedUser: [String]
    var tasks: [TaskModel]
    
}
