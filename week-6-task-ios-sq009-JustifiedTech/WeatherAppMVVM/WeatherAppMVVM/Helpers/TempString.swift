//
//  TempString.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/22/21.
//

import Foundation

extension Double {
    var asTemperature: String {
        return "\(String(format: "%.1f", self))°"
    }
}

let lockRightView: UIView = {

    let imageIcon:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "lock")
        image.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "lock")!.size.width + 10, height: UIImage(systemName: "lock")!.size.height + 10)
        return image
    }()
    
    
    
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "lock")!.size.width + 10, height: UIImage(systemName: "lock")!.size.height + 10)
    view.addSubview(imageIcon)
    
    return view
    
}()


