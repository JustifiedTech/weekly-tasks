//
//  SignupViewController.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/27/21.
//

import UIKit

class SignUpViewController: UIViewController{
    var delegate: ValidationProtocol?
    
    
    let userDefaults = UserDefaults.standard
    
    var coordinator: Coordinator?
    
    var viewModel  = SignUpViewModel()
    
    
    let navigationSet = NavigationSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSet.setBack(navigationController: self.navigationController!)
        navigationSet.setBackButton(navigationItem: navigationItem)
        
        title = "Create your Carbon account"
        setupViews()
        
        
        viewModel.createAccountButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    
    var param = [String:Any]()
    
    @objc func signUp() {
        
        param["firstName"] =  viewModel.firstNameField.text
        param["lastName"]  = viewModel.lastNameField.text
        param["middleName"]  = viewModel.middleNameField.text
        param["email"]  = viewModel.emailField.text
        param["password"] = viewModel.passwordField.text
        param["gender"]  = viewModel.genderField.text
        param["phoneNumber"] = viewModel.phoneNumberField.text
        
        let (validated, error) =  ValidationHandler.shared.formHandler(model: Validation.init(param: param))
        
        if validated {
            
            let users = UserDefaultData.shared.loadUsersFromPhone()
            let count = users?.count ??  0
            
            let id =   count + 1
            let user = User(id: id, firstName: param["firstName"] as! String, lastName: param["lastName"] as! String, middleName:  param["middleName"] as! String, email: param["email"] as! String, password: param["password"] as! String, gender: param["gender"] as! String, phoneNumber: param["phoneNumber"]
                            as! String)
            
            if count > 0 {
                if var users = users {
                    users.append(user)
                    UserDefaultData.shared.saveData(users)
                    
                }
            }
            
            else {
                UserDefaultData.shared.saveData([user])
                
            }
            
            resetAllTextField()
            gotoProfile(userId: user.id)
        }
        else{
            print(error)
        }
    }
    
    func gotoProfile(userId:Int){
        coordinator?.eventOccurred(with: .profile, user: userId)
        
    }
    
    func resetAllTextField() {
        viewModel.firstNameField.text = ""
        viewModel.lastNameField.text = ""
        viewModel.middleNameField.text = ""
        viewModel.emailField.text = ""
        viewModel.passwordField.text = ""
        viewModel.genderField.text = ""
        viewModel.phoneNumberField.text = ""
        
        DispatchQueue.main.async {
            self.delegate?.validatedSignUp()
        }
        
        
    }
    
    private func setupViews() {
        
        viewModel.firstNameStack.addArrangedSubview(viewModel.firstNameLabel)
        viewModel.firstNameStack.addArrangedSubview(viewModel.firstNameField)
        viewModel.middleNameStack.addArrangedSubview(viewModel.middleNameLabel)
        viewModel.middleNameStack.addArrangedSubview(viewModel.middleNameField)
        
        
        
        viewModel.privacyLabel.attributedText = viewModel.attributedLabel
        viewModel.phoneNumberField.rightView = view.flagView
        viewModel.genderField.rightView = view.arrow_downward
        
        
        view.addSubviews(viewModel.welcomeLabel, viewModel.firstNameStack, viewModel.middleNameStack, viewModel.lastNameField, viewModel.createAccountButton, viewModel.privacyLabel, viewModel.emailField, viewModel.phoneNumberField, viewModel.genderField, viewModel.lastNameLabel, viewModel.emailLabel, viewModel.genderLabel, viewModel.phoneNumberLabel, viewModel.passwordField, viewModel.passwordLabel)
        
        let layout = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            viewModel.welcomeLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 10),
            viewModel.welcomeLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10),
            viewModel.welcomeLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -10),
            
            viewModel.firstNameStack.topAnchor.constraint(equalTo: viewModel.welcomeLabel.bottomAnchor, constant: 30),
            viewModel.firstNameStack.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            viewModel.middleNameStack.topAnchor.constraint(equalTo: viewModel.welcomeLabel.bottomAnchor, constant: 30),
            viewModel.middleNameStack.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            
            viewModel.lastNameLabel.topAnchor.constraint(equalTo: viewModel.firstNameStack.bottomAnchor, constant: 16),
            viewModel.lastNameLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            
            viewModel.lastNameField.topAnchor.constraint(equalTo: viewModel.lastNameLabel.bottomAnchor, constant: 5),
            viewModel.lastNameField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.lastNameField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            viewModel.emailLabel.topAnchor.constraint(equalTo: viewModel.lastNameField.bottomAnchor, constant: 16),
            viewModel.emailLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            
            viewModel.emailField.topAnchor.constraint(equalTo: viewModel.emailLabel.bottomAnchor, constant: 5),
            viewModel.emailField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.emailField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            viewModel.passwordLabel.topAnchor.constraint(equalTo: viewModel.emailField.bottomAnchor, constant: 16),
            viewModel.passwordLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            
            viewModel.passwordField.topAnchor.constraint(equalTo: viewModel.passwordLabel.bottomAnchor, constant: 5),
            viewModel.passwordField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.passwordField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            
            
            viewModel.genderLabel.topAnchor.constraint(equalTo: viewModel.passwordField.bottomAnchor, constant: 16),
            
            viewModel.genderLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            viewModel.genderField.topAnchor.constraint(equalTo: viewModel.genderLabel.bottomAnchor, constant: 5),
            
            viewModel.genderField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.genderField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            viewModel.phoneNumberLabel.topAnchor.constraint(equalTo: viewModel.genderField.bottomAnchor, constant: 16),
            viewModel.phoneNumberLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            viewModel.phoneNumberField.topAnchor.constraint(equalTo: viewModel.phoneNumberLabel.bottomAnchor, constant: 5),
            viewModel.phoneNumberField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.phoneNumberField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            viewModel.privacyLabel.topAnchor.constraint(equalTo: viewModel.phoneNumberField.bottomAnchor, constant: 30),
            viewModel.privacyLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10),
            viewModel.privacyLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -10),
            
            viewModel.createAccountButton.topAnchor.constraint(equalTo: viewModel.privacyLabel.bottomAnchor, constant: 10),
            viewModel.createAccountButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.createAccountButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            viewModel.createAccountButton.heightAnchor.constraint(equalToConstant: 60),
            
            
        ])
    }
    
    
}


