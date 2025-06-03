//
//  SigninViewModel.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/7/21.
//

import UIKit

class SigninViewModel {
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "carbon")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()


    let welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Hi there, welcome back. Please sign in."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    let createAccountButton:UIButton = {
        var attributedTitle:NSMutableAttributedString = {
            
            let attributedString =  NSMutableAttributedString(string: "New to Carbon? ", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: UIColor(white: 0.2, alpha: 1) ])
            
            attributedString.append(NSAttributedString(
                string:"Set up new account", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: UIColor(named: "primary")! ]
            ))
            
            return attributedString
        }()
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(attributedTitle, for: .normal)
        btn.setTitleColor(UIColor(named: "primary"), for: .normal)
        
        return btn
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
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.rightViewMode = .always

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
        textField.rightViewMode = .always
        return textField
    }()


    let forgotPassword: UIView = {
        
        let button:UIButton = {
            let btn = UIButton()
            btn.frame = CGRect(x: -5, y: 0, width: 150, height: 10)
            btn.setTitle("Forgot Password?", for: .normal)
            btn.setTitleColor(UIColor(named: "primary"), for: .normal)
            return btn
        }()
        
         let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 10)
        view.addSubview(button)
        return view
        
    }()
}
