//
//  LocalStorage.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import Foundation

class LocalStorage {
    static var recentTasks: [String] {
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
        get {
            UserDefaults.standard.stringArray(forKey: #function) ?? []
        }
    }
    
    static func addTask(task: String) {
        if recentTasks.contains(task) == false {
            recentTasks.insert(task, at: 0)
        }
    }
}
