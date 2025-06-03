//
//  UIview+Extensions.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/28/21.
//


import UIKit


public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    var lockView: UIView{
        let imageIcon:UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "lock")
            image.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "lock")!.size.width + 10, height: UIImage(systemName: "lock")!.size.height + 10)
            image.tintColor = .black
            return image
        }()
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "lock")!.size.width + 10, height: UIImage(systemName: "lock")!.size.height + 10)
        view.addSubview(imageIcon)
        
        return view
        
    }
    
     var flagView: UIView{
        let imageIcon:UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "flag")
            image.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "chevron.down")!.size.width + 10, height: UIImage(systemName: "chevron.down")!.size.height + 10)
            return image
        }()
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "chevron.down")!.size.width + 10, height: UIImage(systemName: "chevron.down")!.size.height + 10)
        view.addSubview(imageIcon)
        return view
    }

    var arrow_downward: UIView {
        let imageIcon:UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "chevron.down")
            image.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "chevron.down")!.size.width, height: UIImage(systemName: "chevron.down")!.size.height)
            image.tintColor = . black
            return image
        }()
        
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "chevron.down")!.size.width, height: UIImage(systemName: "chevron.down")!.size.height)
        view.addSubview(imageIcon)
        
        return view
        
    }
    
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,  right: NSLayoutXAxisAnchor? = nil){
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,  right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: rightConstant).isActive = true
        }
        
    }
    
}

