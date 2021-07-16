//
//  ViewController.swift
//  Floaton
//
//  Created by gokulnair2001 on 07/15/2021.
//  Copyright (c) 2021 gokulnair2001. All rights reserved.
//

import UIKit
import Floaton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Floaton.addFloatingButton(buttonPosition: .right, animationDirect: .vertical, buttonPointSize: 60, imageType: .system, images: ["swift","swift","swift","swift"], imageSizes: [30,24,24, 24], floatonTintColors: [.white, .systemOrange, .white, .systemPink], floatonBGColor: [.black, .systemIndigo, .systemPink, .yellow], view: view)
        Floaton.operatingHapticFeedback(state: true)
        
        Floaton.firstButton.addTarget(self, action: #selector(firstButtonAction), for: .touchUpInside)
        Floaton.secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
        Floaton.thirdButton.addTarget(self, action: #selector(thirdButtonAction), for: .touchUpInside)
    }

    //MARK:- Secondary button actions
    @objc func firstButtonAction() {
        print("1")
    }
    
    @objc func secondButtonAction() {
        print("2")
    }
    
    @objc func thirdButtonAction() {
        print("3")
    }
}

