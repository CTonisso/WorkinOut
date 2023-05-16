//
//  LoginViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

final class LoginViewModel {

    weak var coordinator: AuthCoordinator?
//  TODO:  var loginService: LoginService

    init(_ coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }

    func loginUserWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                strongSelf.coordinator?.start()
            }
            
            print("Login with e-mail was succesful")
          // TODO: ...
        }
    }
    
    func loginUserWithGoogle(viewController: UIViewController) {
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            guard error == nil else {
                // TODO: Implement Crashlytics
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                      // TODO: Implement Crashlytics
                      return
                  }


            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                              accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                print("Login with google was succesful")
//                coordinator?.goToWorkouts()
            }
        }
    }
    
    
    func goToRegister() {
        coordinator?.goToRegister()
    }

}
