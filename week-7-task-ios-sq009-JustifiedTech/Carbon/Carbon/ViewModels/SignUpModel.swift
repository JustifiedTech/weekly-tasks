//
//  ValidationViewModel.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/6/21.
//

import UIKit

class SignUpViewModel{
    
    let welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Let's set things up. Please fill out these basic details to get started"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    
    let firstNameLabel:UILabel = {
        let label = UILabel()
        label.text = "First name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var firstNameField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "First name"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    
    let firstNameStack:UIStackView = {
        
        let stv = UIStackView()
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.alignment = .leading
        stv.distribution = .fill
        stv.spacing = 5
        
        return stv
    }()
    
    
    let middleNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Middle name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var middleNameField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Middle name"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    
    let middleNameStack:UIStackView = {
        let stv = UIStackView()
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.alignment = .leading
        stv.distribution = .fill
        stv.spacing = 5
        return stv
    }()
    
    let lastNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Surname"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var lastNameField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Surname"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var emailField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    
    let passwordLabel:UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var passwordField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.rightViewMode = .always
        return textField
    }()
    
    let genderLabel:UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var genderField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Please select"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.loadDropdownData(data: ["Male", "Female"])
        textField.rightViewMode = .always
        return textField
    }()
    
    let phoneNumberLabel:UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var phoneNumberField:LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone number"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.keyboardType = .phonePad
        textField.rightViewMode = .always
        return textField
    }()
    
    let privacyLabel:UILabel = {
        let label = UILabel()
        label.text = "By continuing, you accept our Terms of Service & Privacy Policy"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    var attributedLabel:NSMutableAttributedString = {
        
        let attributedString =  NSMutableAttributedString(string: "By continuing, you accept our", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: UIColor(white: 0.2, alpha: 1) ])
        
        attributedString.append(NSAttributedString(
            string:" Terms of Service & Privacy Policy", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: UIColor(named: "primary")! ]
        ))
        
        return attributedString
    }()
    
    let createAccountButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Create account", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor(named: "gray")
        return btn
    }()

    
    
    
    
}
