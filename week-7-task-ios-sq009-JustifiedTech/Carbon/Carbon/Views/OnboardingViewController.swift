//
//  Onboard.swift
//  Carbon
//
//  Created by Decagon on 11/30/21.
//

import UIKit

class OnboardingViewController: UIViewController{
    
    let slideViewModel = SlideViewModel()
    var coordinator: Coordinator?
    
    var index = 0;
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "carbon")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    let button:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Set up new account", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor(named: "primary")
        btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return btn
    }()
    
    let navigationSet = NavigationSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSet.setBack(navigationController: self.navigationController!)
        navigationSet.setBackButton(navigationItem: navigationItem)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(gotoSignUp))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "primary")
        setUpView()
        
    }
    
    @objc func didTapButton(){
        coordinator?.eventOccurred(with: .signup, user: 0)
        
    }
    @objc func gotoSignIn(){
        coordinator?.eventOccurred(with: .signin, user: 0)
        
    }
    @objc func gotoSignUp(){
        coordinator?.eventOccurred(with: .signup, user: 0)
        
    }
    
    
    func setUpView(){
        view.addSubviews(collectionView, imageView, button)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 5),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        collectionView.register(SlideCell.self, forCellWithReuseIdentifier: SlideCell.reuseIdentifier)
    }
    
    
}

// MARK: - Collection view datasource
extension OnboardingViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slideViewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCell.reuseIdentifier, for: indexPath) as? SlideCell else {
            return UICollectionViewCell()
        }
        
        let slide = slideViewModel.slides[indexPath.row]
        cell.slide = slide
        return cell
    }
}


extension OnboardingViewController: UICollectionViewDelegate{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        
        
        
        
        if index < 2 {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(gotoSignUp))
            navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "primary")
        }
        
        else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(gotoSignIn))
            navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "primary")
            
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
        
    }
}


