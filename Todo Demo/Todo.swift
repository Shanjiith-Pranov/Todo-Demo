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
        self.name = ""
    }
    
    static func loadSampleData() -> [Todo] {
        let todos = [
            Todo(name: "Shave the cat"),
            Todo(name: "Go see a doctor for deadly scratches")
        ]
        return todos
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "todos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(todos: [Todo]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(todos)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [Todo]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedTodos = try? propertyListDecoder.decode(Array<Todo>.self, from: retrievedFriendsData) else { return nil }
        return decodedTodos
    }
}









