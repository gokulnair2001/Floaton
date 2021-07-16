//
//  FloatonUIModel.swift
//  Floaton
//
//  Created by Gokul Nair on 15/07/21.
//

import UIKit

extension UIButton {
    
    func applyFloatonUI(BGColor: UIColor, imgColor: UIColor) {
        layer.cornerRadius = bounds.height/2
        backgroundColor = BGColor
        tintColor = imgColor
    }
    
    func applyFloatonConfiguration(size: CGFloat, iconName: String, weight: UIImage.SymbolWeight) {
        if Floaton.floatonImageType == .custom {
            setImage(UIImage(named: iconName), for: .normal)
        }else {
            let configuration = UIImage.SymbolConfiguration(pointSize: size, weight: weight)
            let buttonImage = UIImage(systemName: iconName, withConfiguration: configuration)
            setImage(buttonImage, for: .normal)
        }
    }
}
