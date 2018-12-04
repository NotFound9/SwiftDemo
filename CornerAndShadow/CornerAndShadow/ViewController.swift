//
//  ViewController.swift
//  CornerAndShadow
//
//  Created by ruiwendaier on 2018/11/30.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

import UIKit

//https://stackoverflow.com/questions/4754392/uiview-with-rounded-corners-and-drop-shadow
//https://stackoverflow.com/questions/13505379/adding-rounded-corner-and-drop-shadow-to-uicollectionviewcell
//https://stackoverflow.com/questions/37645408/uitableviewcell-rounded-corners-and-shadow
//https://stackoverflow.com/questions/24644802/swift-problems-with-corner-radius-and-drop-shadow
//https://medium.com/bytes-of-bits/swift-tips-adding-rounded-corners-and-shadows-to-a-uiview-691f67b83e4a
//https://www.google.com/search?ei=0ekAXNyXLsWP0gKc1r7QBw&q=swift4+Corner+shadow&oq=swift4+Corner+shadow&gs_l=psy-ab.3...2732125.2732125..2732383...0.0..0.0.0.......0....1..gws-wiz.58_bxTJq4ks
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        byAddingAnotherView()
        byAddingAnotherLayer()
        byChangeLayer()
    }
    
    func byAddingAnotherView() {
        let shadowView = UIView.init()
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowRadius = 15
        shadowView.layer.cornerRadius = 25
        shadowView.frame = CGRect.init(x: (UIScreen.main.bounds.size.width - 50)/2, y: 100, width: 50, height: 50)
        view.addSubview(shadowView)

        
        let button = UIButton.init(type: .custom)
        button.frame = shadowView.bounds
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        shadowView.addSubview(button)
    }
    func byAddingAnotherLayer() {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: (UIScreen.main.bounds.size.width - 50)/2, y: 200, width: 50, height: 50)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        view.addSubview(button)
        
        let subLayer = CALayer.init()
        subLayer.frame = button.frame
        subLayer.cornerRadius=25
        subLayer.backgroundColor = UIColor.blue.cgColor
        subLayer.masksToBounds=false
        subLayer.shadowColor = UIColor.darkGray.cgColor
        subLayer.shadowOffset = CGSize(width: 0.0, height: 10)
        subLayer.shadowOpacity = 1;
        subLayer.shadowRadius = 15;
        view.layer.insertSublayer(subLayer, below: button.layer)

    }

    func byChangeLayer() {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: (UIScreen.main.bounds.size.width - 50)/2, y: 300, width: 50, height: 50)
        button.backgroundColor = UIColor.blue
        view.addSubview(button)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 15
        button.layer.shadowPath = UIBezierPath.init(roundedRect: button.layer.bounds, cornerRadius: button.layer.cornerRadius).cgPath
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
    }
}


