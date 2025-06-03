//
//  SlideViewModel.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/1/21.
//

import Foundation

class SlideViewModel {
    
    let firstSlide = Slide(
        imageName: "phone",
        title: "Go beyond banking",
        subTitle: "Welcome to the future. Carbon is your passport to world-class financial services, built just for you."
    )
    
    let secondSlide = Slide(
        imageName: "card",
        title: "Stay on top of your finances. Anytime. Anywhere",
        subTitle: "Carbon makes financial services faster, cheaper and more convenient. You can access the app 24/7, wherever you are."
    )
    let thirdSlide = Slide(
        imageName: "users",
        title: "Trusted by millions",
        subTitle: "With Carbon's market-leading service already used by millions of people just like you, you're in very good company."
    )
    
    
    var slides:[Slide] {
        return [firstSlide, secondSlide, thirdSlide]
    }
    
}
