//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Yaser on 3/31/21.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: -  Properties
    private var loginViewModel = LoginViewModel()
    
    private let iconeImage:UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.isEnabled = false
        btn.backgroundColor = loginViewModel.buttonBackgroundColor
        btn.setTitleColor(loginViewModel.buttonFontColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.cornerRadius = 5
        btn.setHeight(50)
        btn.addTarget(self, action: #selector(didtapLogin), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var forgotPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle(firstPart: "Forgot your password?  ", secondPart: "Get help in signing in")
        btn.addTarget(self, action: #selector(didtapLogin), for: .touchUpInside)
        return btn
    }()
    
    private lazy var dontHaveAcountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle(firstPart: "Dont have an account?  ", secondPart: "Sign Up")
        btn.addTarget(self, action: #selector(didtapShowsSignUp), for: .touchUpInside)
        return btn
    }()
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        configureNotificactionObservers()
    }
    
    //MARK: - Actions
    @objc func didtapShowsSignUp() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func didtapLogin() {
        print("did tap username")
        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender == emailTextField {
            loginViewModel.email = sender.text
        } else if sender == passwordTextField {
            loginViewModel.password = sender.text
        }
        
        updateForm()
    }
    
    //MARK: -  Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconeImage)
        iconeImage.centerX(inView: view)
        iconeImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconeImage.setDimensions(height: 80, width: 120)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: iconeImage.bottomAnchor, left: view.leftAnchor,
                         right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.centerX(inView: view)
        forgotPasswordButton.anchor(top: stackView.bottomAnchor, paddingTop: 20)
        
        view.addSubview(dontHaveAcountButton)
        dontHaveAcountButton.centerX(inView: view)
        dontHaveAcountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        
    }
    
    func configureNotificactionObservers() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

}


extension LoginViewController: FormViewModel {
    
    func updateForm() {
        loginButton.isEnabled = loginViewModel.formValidation
        loginButton.backgroundColor = loginViewModel.buttonBackgroundColor
        loginButton.setTitleColor(loginViewModel.buttonFontColor, for: .normal)
    }
}
