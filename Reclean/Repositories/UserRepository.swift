//
//  UserRepository.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import Foundation
import CloudKit

class UserRepository {
    
    static let shared = UserRepository()
    private let isUserAuthorizedKey = "isUserAuthorized"
    private let userIdKey = "id"
    private let fullNameKey = "fullName"
    private let emailKey = "email"
    private let recordType = "Account"
    
    func isUserAuthorized() -> Bool {
        UserDefaults.standard.bool(forKey: isUserAuthorizedKey)
    }
    
    func setUserAuthorization(status: Bool) {
        UserDefaults.standard.set(status, forKey: isUserAuthorizedKey)
    }
    
    func setUser(model: User) {
        UserDefaults.standard.set(model.userId, forKey: userIdKey)
        
        getUserFromCloudKit(userId: model.userId ?? "") { result in
            if result == nil {
                self.addUserToCloudKit(model: model)
            }
        }
    }
    
    func getUser(didGetUser: ((User?) -> Void)?) {
        let userId = UserDefaults.standard.string(forKey: userIdKey)
        
        getUserFromCloudKit(userId: userId ?? "") { result in
            didGetUser?(result)
        }
    }
    
    private func addUserToCloudKit(model: User) {
        let userRecord = CKRecord(recordType: recordType)
        userRecord.setValuesForKeys([
            userIdKey: model.userId ?? "",
            fullNameKey: model.fullName ?? "",
            emailKey: model.email ?? ""
        ])
        
        let container: CKContainer = .default()
        let database: CKDatabase = container.publicCloudDatabase
        database.save(userRecord) { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func getUserFromCloudKit(userId: String, didGetUserFromCloudKit: ((User?) -> Void)?) {
        let container: CKContainer = .default()
        let database: CKDatabase = container.publicCloudDatabase
        let predicate = NSPredicate(format: "\(userIdKey) == %@", userId)
        let query: CKQuery = CKQuery(recordType: recordType, predicate: predicate)
        
        database.fetch(withQuery: query) { result in
            switch result {
            case let .success((records, _)):
                let items = records.compactMap { $0.1.map { $0 } }
                
                if case let .success(record) = items.first {
                    let userId = record.value(forKey: self.userIdKey) as? String
                    let fullName = record.value(forKey: self.fullNameKey) as? String
                    let email = record.value(forKey: self.emailKey) as? String
                    
                    let user = User(
                        userId: userId,
                        fullName: fullName,
                        email: email
                    )
                    didGetUserFromCloudKit?(user)
                } else {
                    didGetUserFromCloudKit?(nil)
                }
            case let .failure(error):
                print(error.localizedDescription)
                didGetUserFromCloudKit?(nil)
            }
        }
    }
}
