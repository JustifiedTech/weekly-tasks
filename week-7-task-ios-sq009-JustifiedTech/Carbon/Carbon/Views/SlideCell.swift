//
//  SlideCell.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/1/21.
//

import UIKit

class SlideCell: UICollectionViewCell {
    static let reuseIdentifier = "SlideCell"
    
    let slideViewModel = SlideViewModel()
    
    var slide: Slide? {
        didSet{
            guard let slide = slide else{
                return
            }
            imageView.image = UIImage(named: slide.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedString =  NSMutableAttributedString(string: slide.title, attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color ])
            
            attributedString.append(NSAttributedString(
                string:"\n\n\(slide.subTitle)", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color ]
            ))
            titleLabel.attributedText = attributedString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init not implemented yet")
    }
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.clipsToBounds = true
        return image
    }()
    
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
 
    
    
    func setUpView(){
        self.addSubviews(imageView, titleLabel)
        self.backgroundColor = .white
        let layout = layoutMarginsGuide
        imageView.anchorWithConstantsToTop(
            top: layout.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 150, leftConstant: 0, bottomConstant: 0, rightConstant: 0
        )
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        titleLabel.anchorWithConstantsToTop(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: -20
        )
        
     
    }
}
