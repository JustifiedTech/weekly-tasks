//
//  SigninViewController.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/27/21.
//

import UIKit

class SignInViewController: UIViewController{
    
    var delegate: ValidationProtocol?
    
    var coordinator: Coordinator?
    var viewModel  = SigninViewModel()
    
    let navigationSet = NavigationSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSet.setBack(navigationController: self.navigationController!)
        navigationSet.setBackButton(navigationItem: navigationItem)
        setupViews()
        
    }
    
    
    
    var param = [String:Any]()
    
    @objc func signIn() {
        
        param["email"]  = viewModel.emailField.text
        param["password"] = viewModel.passwordField.text
        
        let (validated, error) =  ValidationHandler.shared.formHandler(model: Validation.init(param: param))
        
        if validated {
            
            let userEmail = param["email"]
            let userPassword = param["password"]
            
            let users = UserDefaultData.shared.loadUsersFromPhone()
            let count = users?.count ??  0
            
            if count > 0 {
                let currentUser = users?.filter{ user in
                    user.email  == userEmail as? String
                }
                
                if (currentUser?.count ?? 0) > 0 {
                    if  currentUser?.first?.password == userPassword as? String {
                        print(currentUser?.first?.firstName ?? "")
                        
                        resetAllFields()
                        
                        UserDefaultData.shared.setUser(isLogin: true, user: currentUser?.first?.id ?? 0)
                        gotoProfile(userId: currentUser?.first?.id ?? 0)
                        
                    }
                    else {
                        print("password is not correct")
                    }
                }
                else {
                    print("user not found")
                }
            }
            
            else {
                
                print("user not found")
            }
        }
        else{
            print(error)
        }
    }
    
    func resetAllFields (){
        viewModel.passwordField.text = ""
        viewModel.emailField.text = ""
    }
    
    func gotoProfile(userId:Int){
        coordinator?.eventOccurred(with: .profile, user: userId)
        
    }
    
    @objc func gotoSignUp(){
        coordinator?.eventOccurred(with: .signup, user: 0)
        
    }
    
    private func setupViews() {
        viewModel.createAccountButton.addTarget(self, action: #selector(gotoSignUp), for: .touchUpInside)
        
        viewModel.passwordField.rightView = viewModel.forgotPassword
        viewModel.passwordField.addTarget(self, action: #selector(signIn), for: .editingChanged)
        view.addSubviews(viewModel.welcomeLabel, viewModel.emailLabel, viewModel.emailField, viewModel.passwordField, viewModel.createAccountButton, viewModel.imageView, viewModel.passwordLabel)
        let layout = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            viewModel.imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            viewModel.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewModel.imageView.heightAnchor.constraint(equalToConstant: 60),
            
            viewModel.welcomeLabel.topAnchor.constraint(equalTo: viewModel.imageView.bottomAnchor, constant: 20),
            viewModel.welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewModel.welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            viewModel.emailLabel.topAnchor.constraint(equalTo: viewModel.welcomeLabel.bottomAnchor, constant: 50),
            viewModel.emailLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            viewModel.emailField.topAnchor.constraint(equalTo: viewModel.emailLabel.bottomAnchor, constant: 16),
            viewModel.emailField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.emailField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            viewModel.emailField.heightAnchor.constraint(equalToConstant: 60),
            
            
            viewModel.passwordLabel.topAnchor.constraint(equalTo: viewModel.emailField.bottomAnchor, constant: 30),
            viewModel.passwordLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            
            viewModel.passwordField.topAnchor.constraint(equalTo: viewModel.passwordLabel.bottomAnchor, constant: 16),
            viewModel.passwordField.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.passwordField.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            viewModel.passwordField.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            viewModel.createAccountButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -20),
            viewModel.createAccountButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.createAccountButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
        ])
    }
    
}



