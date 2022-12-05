//
//  SignInViewModel.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import Foundation

class SignInViewModel {
    
    func markUserAuthorized() {
        UserRepository.shared.setUserAuthorization(status: true)
    }
    
    func setUserInformation(model: User) {
        UserRepository.shared.setUser(model: model)
    }
}
