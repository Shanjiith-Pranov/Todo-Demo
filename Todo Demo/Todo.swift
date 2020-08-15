//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation

class Todo: Codable {
    
    var name: String
    var done = false
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = "I forgot your name"
    }
    
    static func sampleData() -> [Todo] {
        let todos = [
            Todo(name: "Shave the cat"),
            Todo(name: "Go see a doctor for deadly scratches")
        ]
        return todos
    }
}

// Um i'm going to try to make a change here
//henlo i is joel







