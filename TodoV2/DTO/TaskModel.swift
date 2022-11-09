//
//  TaskModel.swift
//  TodoV2
//
//  Created by Tamanna Khan on 2022-11-04.
//

import Foundation

struct TaskModel: Codable, Identifiable {
    
    var id: String
    var title: String
    var description: String
    var assignedUsers: [String]
    
    
}
