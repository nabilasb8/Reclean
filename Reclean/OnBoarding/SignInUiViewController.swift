//
//  SignInUiViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit
import AuthenticationServices

class SignInUiViewController: UIViewController {
    
    var viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueSignIn(_ sender: Any) {
        signInWithAppleId()
    }
    
    func signInWithAppleId() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func goToTabBarController() {
        if let navigationController = navigationController {
            let viewController = TabBarController()
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.setViewControllers([viewController], animated: true)
        }
    }
    
}

extension SignInUiViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

extension SignInUiViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            print("ASAuthorizationAppleIDCredential \(userIdentifier) \(fullName)")
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            print("ASPasswordCredential \(username) \(password)")
        default:
            break
        }
        
        viewModel.markUserAuthorized()
        goToTabBarController()
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
