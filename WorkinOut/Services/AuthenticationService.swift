//
//  AuthenticationService.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

internal final class AuthenticationService {
    
    internal func loginUserWithEmail(email: String, password: String, _ completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                completion(false)
            } else {
                completion(true)
            }

            print("Login with e-mail was succesful")
          // TODO: Implement user persistency
        }
    }
    
    internal func loginUserWithGoogle(viewController: UIViewController?, _ completion: @escaping (Bool) -> Void) {
        guard let viewController = viewController else {
            // TODO: Implement user feedback
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            guard error != nil else {
                // TODO: Implement user feedback
                completion(false)
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                      // TODO: Implement user feedback
                      completion(false)
                      return
                  }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                              accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                print("Login with google was succesful")
                completion(true)
                // TODO: Implement user persistency
            }
        }
    }

    internal func register(withEmail email: String, password: String, _ completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard error != nil else {
                // TODO: Implement user feedback
                completion(false)
                return
            }
            
            // TODO: Persist user data and login inside this method
            self.loginUserWithEmail(email: email, password: password, completion)
        }
    }
}
