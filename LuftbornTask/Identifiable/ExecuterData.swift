//
//  ExecuterData.swift
//  LuftbornTask
//
//  Created by mohamed on 6/18/22.
//

import Foundation

struct ExecuterData: Identifiable {
    //MARK: - Properties
    var id = UUID().uuidString
    var createAt: String
    var taskName: String
    
    //MARK: - Init
    init(createAt: String? = nil,
         taskName: String? = nil) {
        self.createAt = createAt ?? ""
        self.taskName = taskName ?? ""
    }
}
