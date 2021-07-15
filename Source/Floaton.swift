//
//  Floaton.swift
//  Floaton
//
//  Created by Gokul Nair on 15/07/21.
//

import UIKit

public class Floaton {
    
    private static let mainButton = UIButton()
    public static let firstButton = UIButton()
    public static let secondButton = UIButton()
    public static let thirdButton = UIButton()
    
    private static var haptics = false
    
    private static var isAnimationRequired = false
    
    private static var floatonAnimationDirection = animationDirection.spread
    private static var floatonPosition = buttonPosition.centre
    static var floatonImageType = imageType.system
    
    
    public static func addFloatingButton(buttonPosition: buttonPosition, animationDirect: animationDirection, buttonPointSize: CGFloat, imageType: imageType, images:[String], floatonTintColors: [UIColor], floatonBGColor: [UIColor], view: UIView) {
        
        let Width:CGFloat = buttonPointSize
        
        // Sue switch case
        if buttonPosition == .right {
            mainButton.frame = CGRect(x: view.frame.width - (Width + 20) , y: view.frame.height - (Width + 20), width: Width, height: Width)
        }else if buttonPosition == .left {
            mainButton.frame = CGRect(x: mainButton.frame.width/2 + 20 , y: view.frame.height - (Width + 20), width: Width, height: Width)
        }else if buttonPosition == .centre {
            mainButton.frame = CGRect(x: view.frame.width/2 - Width/2 , y: view.frame.height - (Width + 20), width: Width, height: Width)
        }
        
        floatonImageType = imageType
        floatonPosition = buttonPosition
        floatonAnimationDirection = animationDirect
        
       
       
        
        //        mainButton.layer.borderWidth = 1
        //        mainButton.layer.borderColor = UIColor.black.cgColor
        
        
        
        
        let rootButtonWidth:CGFloat = Width/2 + 5
        
        firstButton.frame = CGRect(x: mainButton.center.x - rootButtonWidth/2, y: mainButton.center.y - rootButtonWidth/2, width: rootButtonWidth, height: rootButtonWidth)
        
        
        
        secondButton.frame = CGRect(x: mainButton.center.x - rootButtonWidth/2, y: mainButton.center.y - rootButtonWidth/2, width: rootButtonWidth, height: rootButtonWidth)
        
        
        
        
        
        
        thirdButton.frame = CGRect(x: mainButton.center.x - rootButtonWidth/2, y: mainButton.center.y - rootButtonWidth/2, width: rootButtonWidth, height: rootButtonWidth)
        
        if images.count == 4 && floatonTintColors.count == 4 {
            
            mainButton.applyButtonConfiguration(size: 30, iconName: images[0], weight: .regular)
            mainButton.applyButtonUI(BGColor: floatonBGColor[0], imgColor: floatonTintColors[0])
            
            firstButton.applyButtonUI(BGColor: floatonBGColor[1], imgColor: floatonTintColors[1])
            firstButton.applyButtonConfiguration(size: 24, iconName: images[1], weight: .medium)
            
            secondButton.applyButtonUI(BGColor: floatonBGColor[2], imgColor: floatonTintColors[2])
            secondButton.applyButtonConfiguration(size: 24, iconName: images[2], weight: .medium)
            
            thirdButton.applyButtonUI(BGColor: floatonBGColor[3], imgColor: floatonTintColors[3])
            thirdButton.applyButtonConfiguration(size: 24, iconName: images[3], weight: .medium)
            
        }else {
            print("Floaton Warning: Images and FloatonTintColors must be 4 in count respectively")
        }
        
        
        mainButton.addTarget(self, action: #selector(performAction), for: .touchUpInside)
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(mainButton)
        
        
    }
    //MARK:- Main button action
    
    
    @objc static func performAction() {
        isAnimationRequired.toggle()
        buttonRotation()
        hapticFeedback()
        if floatonAnimationDirection == .horizontal {
            animateInHorizontal()
        }else if floatonAnimationDirection == .vertical {
            animateInVertical()
        }else if floatonAnimationDirection == .spread {
            animateInSpread()
        }
    }
    
    //MARK:- Vertical animation
    
    static func animateInVertical() {
        if isAnimationRequired {
            let padding = 2*firstButton.frame.width
            
            UIView.animate(withDuration: 0.5) {
                firstButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y - (firstButton.frame.width/2 + padding))
                secondButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y - (secondButton.frame.width/2 + padding*2))
                thirdButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y - (thirdButton.frame.width/2 + padding*3))
            }
        }else {
            originalPositionAnimation()
        }
    }
    
    //MARK:- Horizontal animation
    
    
    private static func animateInHorizontal() {
        if isAnimationRequired {
            
            let padding = 2*firstButton.frame.width
            
            if floatonPosition == .left {
                UIView.animate(withDuration: 0.5) {
                    firstButton.center = CGPoint(x: mainButton.center.x + padding, y: mainButton.center.y)
                    secondButton.center = CGPoint(x: mainButton.center.x + padding*2, y: mainButton.center.y)
                    thirdButton.center = CGPoint(x: mainButton.center.x + padding*3, y: mainButton.center.y)
                }
            }else if floatonPosition == .right {
                UIView.animate(withDuration: 0.5) {
                    firstButton.center = CGPoint(x: mainButton.center.x - padding, y: mainButton.center.y)
                    secondButton.center = CGPoint(x: mainButton.center.x - padding*2, y: mainButton.center.y)
                    thirdButton.center = CGPoint(x: mainButton.center.x - padding*3, y: mainButton.center.y)
                }
            }
            
        }else {
            originalPositionAnimation()
        }
    }
    
    //MARK:- Spread animation
    
    private static func animateInSpread() {
        if isAnimationRequired {
            
            let padding = 2*firstButton.frame.width
            
            if floatonPosition == .centre {
                UIView.animate(withDuration: 0.5) {
                    firstButton.center = CGPoint(x: mainButton.center.x - padding, y: mainButton.center.y)
                    secondButton.center = CGPoint(x: mainButton.center.x , y: mainButton.center.y - padding)
                    thirdButton.center = CGPoint(x: mainButton.center.x + padding, y: mainButton.center.y)
                }
            }else if floatonPosition == .left {
                
                UIView.animate(withDuration: 0.5) {
                    firstButton.center = CGPoint(x: mainButton.center.x , y: mainButton.center.y - padding)
                    secondButton.center = CGPoint(x: mainButton.center.x + padding/2 + 12, y: mainButton.center.y - padding/2 - 10)
                    thirdButton.center = CGPoint(x: mainButton.center.x + padding, y: mainButton.center.y)
                }
                
            }else if floatonPosition == .right {
                UIView.animate(withDuration: 0.5) {
                    firstButton.center = CGPoint(x: mainButton.center.x , y: mainButton.center.y - padding)
                    secondButton.center = CGPoint(x: mainButton.center.x - padding/2 - 12, y: mainButton.center.y - padding/2 - 12)
                    thirdButton.center = CGPoint(x: mainButton.center.x - padding, y: mainButton.center.y)
                }
            }
            
        }else {
            originalPositionAnimation()
        }
    }
    
    
    //MARK:-  Button rotation animation
    
    private static func buttonRotation() {
        if isAnimationRequired {
            UIView.animate(withDuration: 0.5, animations: ({
                mainButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
            }))
        }else {
            UIView.animate(withDuration: 0.5, animations: ({
                mainButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
            }))
        }
    }
    
    private static func originalPositionAnimation() {
        UIView.animate(withDuration: 0.5) {
            firstButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y)
            secondButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y)
            thirdButton.center = CGPoint(x: mainButton.center.x, y: mainButton.center.y)
        }
    }
    //MARK:- Haptic Feedback Operation
    public static func operatingHapticFeedback(state: Bool) {
        haptics = state
    }
    
    private static func hapticFeedback() {
        if haptics {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
}

