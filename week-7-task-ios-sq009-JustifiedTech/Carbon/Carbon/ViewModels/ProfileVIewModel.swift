//
//  ProfileVIewModel.swift
//  Carbon
//
//  Created by Decagon on 12/7/21.
//

import UIKit


class ProfileViewModel {
    
    
    let topView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "light")
        return view
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
            textField.textColor = UIColor(named: "secondary")
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            textField.isUserInteractionEnabled = false
            textField.layer.cornerRadius = 10
            textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
            textField.rightViewMode = .unlessEditing
            return textField
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
            textField.textColor = UIColor(named: "secondary")
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            textField.isUserInteractionEnabled = false
            textField.layer.cornerRadius = 10
            textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
            return textField
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
        textField.textColor = UIColor(named: "secondary")
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.isUserInteractionEnabled = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.rightViewMode = .unlessEditing
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
        textField.textColor = UIColor(named: "secondary")
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.isUserInteractionEnabled = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
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
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.textColor = UIColor(named: "secondary")
        textField.isUserInteractionEnabled = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
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
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.isUserInteractionEnabled = false
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = UIColor(named: "secondary")
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.rightViewMode = .always
        return textField
    }()
    
   
    let nextButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor(named: "primary")
        return btn
    }()
    

    
     let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    
}
