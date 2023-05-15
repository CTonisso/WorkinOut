//
//  LoginViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    
}

final class LoginViewModel {

    weak var delegate: LoginViewModelDelegate?
    
}
