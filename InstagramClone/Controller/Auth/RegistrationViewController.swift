//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Yaser on 3/31/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: -  Properties
    private var registerationViewModel = RegisterationViewModel()
    
    private lazy var plusPhotoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        
        btn.tintColor = .white
//        btn.layer.cornerRadius = btn.frame.width / 2
//        btn.layer.masksToBounds = true
//        btn.layer.borderWidth = 2
//        btn.layer.borderColor = UIColor.white.cgColor
        return btn
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
    
    private let fullnameTextField = CustomTextField(placeholder: "Full Name")
    
    private let usernameTextField = CustomTextField(placeholder: "User Name")
    
    private lazy var signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = registerationViewModel.buttonBackgroundColor
        btn.setTitleColor(registerationViewModel.buttonFontColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.cornerRadius = 5
        btn.setHeight(50)
        return btn
    }()
    
    private lazy var alreadyHaveAcountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle(firstPart: "Already have an account?  ", secondPart: "Log in")
        btn.addTarget(self, action: #selector(didtapShowsLogIn), for: .touchUpInside)
        return btn
    }()
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        configureNotificactionObservers()
    }
    
    //MARK: - Actions
    @objc func didtapShowsLogIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didtapSignup() {
        print("did tap didtapSignup")
    }
    
    @objc func tappedAddPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender == emailTextField {
            registerationViewModel.email = sender.text
        } else if sender == passwordTextField {
            registerationViewModel.password = sender.text
        
        } else if sender == fullnameTextField {
            registerationViewModel.fullname = sender.text
        
        } else if sender == usernameTextField {
            registerationViewModel.username = sender.text
        }
        
        updateForm()
    }
    
    //MARK: -  Helpers
    
    func configureUI() {
        
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(height: 120, width: 120)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor,
                         right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAcountButton)
        alreadyHaveAcountButton.centerX(inView: view)
        alreadyHaveAcountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
    }
    
    func configureNotificactionObservers() {
        plusPhotoButton.addTarget(self, action: #selector(tappedAddPhoto), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didtapSignup), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
}

//MARK: -  FormViewModel

extension RegistrationViewController: FormViewModel {
    
    func updateForm() {
        signUpButton.isEnabled = registerationViewModel.formValidation
        signUpButton.backgroundColor = registerationViewModel.buttonBackgroundColor
        signUpButton.setTitleColor(registerationViewModel.buttonFontColor, for: .normal)
    }
}

//MARK: -  UIImagePickerControllerDelegate

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
