//
//  UserRepository.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import Foundation

class UserRepository {
    
    static let shared = UserRepository()
    let isUserAuthorizedKey = "isUserAuthorized"
    
    func isUserAuthorized() -> Bool {
        UserDefaults.standard.bool(forKey: isUserAuthorizedKey)
    }
    
    func setUserAuthorization(status: Bool) {
        UserDefaults.standard.set(status, forKey: isUserAuthorizedKey)
    }
}
