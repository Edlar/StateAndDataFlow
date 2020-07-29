//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    @Published private(set) var isRegister = UserDefaults.standard.bool(
        forKey: keys.isRagister.rawValue)
    @Published private(set) var userName = UserDefaults.standard.string(
        forKey: keys.userName.rawValue)
    
    private let userDefault = UserDefaults.standard
    
    private enum keys: String {
        case isRagister
        case userName
    }
    
    func setUser(name: String) {
        userDefault.set(name, forKey: keys.userName.rawValue)
        userDefault.set(true, forKey: keys.isRagister.rawValue)
        self.userName = name
        self.isRegister = true
    }
    
    func removeAll() {
        userDefault.removeObject(forKey: keys.userName.rawValue)
        userDefault.removeObject(forKey: keys.isRagister.rawValue)
        self.userName = nil
        self.isRegister = false
    }
}
