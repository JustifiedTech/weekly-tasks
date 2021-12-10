//
//  SignupViewController.swift
//  Carbon
//
//  Created by Decagon on 11/27/21.
//

import UIKit

class ProfileViewController: UIViewController{
    var coordinator: Coordinator?
    let viewModel = ProfileViewModel()
    var userId = 0;
    
    
    let navigationSet = NavigationSet()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationSet.setBack(navigationController: self.navigationController!)
        navigationSet.setBackButton(navigationItem: navigationItem)
        title = "Personal details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "primary")
        
    }
    
    
    override func viewDidLayoutSubviews() {
        setupViews()
        loadData()
    }
    
    @objc func didTapButton(){
        //do action here
        
    }
    
    
    
    fileprivate func loadData(){
        let users = UserDefaultData.shared.loadUsersFromPhone()
        
        if let user = users?[userId - 1] {
            
            viewModel.firstNameField.text = user.firstName
            viewModel.middleNameField.text = user.middleName
            viewModel.lastNameField.text = user.lastName
            viewModel.genderField.text = user.gender
            viewModel.phoneNumberField.text = user.phoneNumber
            viewModel.emailField.text = user.email
            
        }
        
    }
    
    
    private func setupViews() {
        
        viewModel.firstNameField.rightView = view.lockView
        viewModel.lastNameField.rightView = view.lockView
        viewModel.phoneNumberField.rightView = view.flagView
        viewModel.genderField.rightView = view.lockView
        
        viewModel.contentView.addSubview(viewModel.firstNameLabel)
        viewModel.contentView.addSubview(viewModel.firstNameField)
        viewModel.contentView.addSubview(viewModel.nextButton)
        viewModel.contentView.addSubview(viewModel.middleNameField)
        viewModel.contentView.addSubview(viewModel.middleNameLabel)
        viewModel.contentView.addSubview(viewModel.emailField)
        viewModel.contentView.addSubview(viewModel.emailLabel)
        //        contentView.addSubview(passwordField)
        //        contentView.addSubview(passwordLabel)
        viewModel.contentView.addSubview(viewModel.phoneNumberField)
        viewModel.contentView.addSubview(viewModel.phoneNumberLabel)
        viewModel.contentView.addSubview(viewModel.genderLabel)
        viewModel.contentView.addSubview(viewModel.genderField)
        viewModel.contentView.addSubview(viewModel.lastNameLabel)
        viewModel.contentView.addSubview(viewModel.lastNameField)
        
        viewModel.scrollView.addSubview(viewModel.contentView)
        
        view.addSubviews(viewModel.topView, viewModel.scrollView)
        
        let layout = view.safeAreaLayoutGuide
        let contentViewCenterY = viewModel.contentView.centerYAnchor.constraint(equalTo: viewModel.scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        
        let contentViewHeight = viewModel.contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        NSLayoutConstraint.activate([
            
            
            
            viewModel.topView.topAnchor.constraint(equalTo: layout.topAnchor, constant: 5),
            viewModel.topView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10),
            viewModel.topView.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -10),
            viewModel.topView.heightAnchor.constraint(equalToConstant: 80),
            
            
            viewModel.scrollView.topAnchor.constraint(equalTo: viewModel.topView.bottomAnchor),
            viewModel.scrollView.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            viewModel.scrollView.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            viewModel.scrollView.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            
            
            viewModel.contentView.topAnchor.constraint(equalTo: viewModel.scrollView.contentLayoutGuide.topAnchor),
            viewModel.contentView.bottomAnchor.constraint(equalTo: viewModel.scrollView.contentLayoutGuide.bottomAnchor),
            viewModel.contentView.leadingAnchor.constraint(equalTo: viewModel.scrollView.contentLayoutGuide.leadingAnchor),
            viewModel.contentView.trailingAnchor.constraint(equalTo: viewModel.scrollView.contentLayoutGuide.trailingAnchor),
            
            viewModel.contentView.centerXAnchor.constraint(equalTo: viewModel.scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight,
            
            viewModel.firstNameLabel.topAnchor.constraint(equalTo: viewModel.contentView.topAnchor, constant: 16),
            viewModel.firstNameLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            
            viewModel.firstNameField.topAnchor.constraint(equalTo: viewModel.firstNameLabel.bottomAnchor, constant: 5),
            viewModel.firstNameField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.firstNameField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
            viewModel.middleNameLabel.topAnchor.constraint(equalTo: viewModel.firstNameField.bottomAnchor, constant: 16),
            viewModel.middleNameLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            
            viewModel.middleNameField.topAnchor.constraint(equalTo: viewModel.middleNameLabel.bottomAnchor, constant: 5),
            viewModel.middleNameField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.middleNameField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
            
            
            viewModel.lastNameLabel.topAnchor.constraint(equalTo: viewModel.middleNameField.bottomAnchor, constant: 16),
            viewModel.lastNameLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            
            viewModel.lastNameField.topAnchor.constraint(equalTo: viewModel.lastNameLabel.bottomAnchor, constant: 5),
            viewModel.lastNameField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.lastNameField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
            
            viewModel.emailLabel.topAnchor.constraint(equalTo: viewModel.lastNameField.bottomAnchor, constant: 16),
            viewModel.emailLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            
            viewModel.emailField.topAnchor.constraint(equalTo: viewModel.emailLabel.bottomAnchor, constant: 5),
            viewModel.emailField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.emailField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
                            
            viewModel.genderLabel.topAnchor.constraint(equalTo: viewModel.emailField.bottomAnchor, constant: 16),
            
            viewModel.genderLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            viewModel.genderField.topAnchor.constraint(equalTo: viewModel.genderLabel.bottomAnchor, constant: 5),
            
            viewModel.genderField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.genderField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
            
            viewModel.phoneNumberLabel.topAnchor.constraint(equalTo: viewModel.genderField.bottomAnchor, constant: 16),
            viewModel.phoneNumberLabel.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            
            viewModel.phoneNumberField.topAnchor.constraint(equalTo: viewModel.phoneNumberLabel.bottomAnchor, constant: 5),
            viewModel.phoneNumberField.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant: 10),
            viewModel.phoneNumberField.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -10),
            
        
            
            viewModel.nextButton.topAnchor.constraint(equalTo: viewModel.phoneNumberField.bottomAnchor, constant: 60),
            viewModel.nextButton.leadingAnchor.constraint(equalTo: viewModel.contentView.leadingAnchor, constant:16),
            viewModel.nextButton.trailingAnchor.constraint(equalTo: viewModel.contentView.trailingAnchor, constant: -16),
            viewModel.nextButton.heightAnchor.constraint(equalToConstant: 60)
            
            
            
        ])
    }
    
    
}



