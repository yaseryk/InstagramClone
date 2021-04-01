//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Yaser on 4/1/21.
//

import Foundation
import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthrntivationViewModel {
    var formValidation: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonFontColor: UIColor { get }
}

struct LoginViewModel: AuthrntivationViewModel {
    var email: String?
    var password: String?
    
    var formValidation: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formValidation ? #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonFontColor: UIColor {
        return formValidation ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.5)
    }
}

struct RegisterationViewModel: AuthrntivationViewModel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formValidation: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formValidation ? #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonFontColor: UIColor {
        return formValidation ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.5)
    }
}
