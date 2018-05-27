//
//  MainHeader.swift
//  CapitalOneApp
//
//  Created by Niranjan Senthilkumar on 5/24/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit
import TCProgressBar
import GTProgressBar

var revenueTotal = String()

class MainHeader: UICollectionViewCell {
    
    let progressBar = TCProgressBar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 200,
                                                  height: 20))
    
    let progressBarz: GTProgressBar = {
        let progressBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        progressBar.progress = 0.3
        progressBar.barBorderColor = UIColor.black
        progressBar.barFillColor = UIColor.rgb(red: 255, green: 51, blue: 102)
        progressBar.barBackgroundColor = UIColor.white
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor.black
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        progressBar.font = UIFont(name: "Avenir-Heavy", size: 18)!
        progressBar.labelPosition = GTProgressBarLabelPosition.right
        progressBar.barMaxHeight = 16
        progressBar.direction = GTProgressBarDirection.clockwise
        return progressBar
    }()
    
    let textView: UILabel = {
        let tv = UILabel()
        tv.text = "Progress towards reward"
        tv.numberOfLines = 0
        tv.textAlignment = .center
        tv.adjustsFontSizeToFitWidth = true
        tv.font = UIFont(name: "Avenir-Medium", size: 24)
        return tv
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        backgroundColor = UIColor.rgb(red: 245, green: 241, blue: 237)
        
        progressBar.outlineColor = .black
        progressBar.outlineWidth = 0.5
        progressBar.spacing = 5
        progressBar.progressColor = UIColor.rgb(red: 255, green: 51, blue: 102)
        progressBar.backgroundColor = .white
        progressBar.value = 0.2
        
        addSubview(textView)
        textView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 35, paddingBottom: 45, paddingRight: 35, width: 0, height: 0)
        
//        addSubview(progressBar)
//        progressBar.anchor(top: textView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0)
        
        addSubview(progressBarz)
        progressBarz.anchor(top: textView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 25, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let spendingTotal:Int = 300
        var revTotal:Decimal = 0
        
        print(revenueTotal)
        print(123)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let number = formatter.number(from: revenueTotal) {
            let amount = number.decimalValue
            revTotal = amount
        }
        
        var percentage: Double = Double(spendingTotal)/Double(revTotal as NSNumber)
        
        if percentage > 1.0 {
            progressBar.value = 1
            progressBarz.progress = CGFloat(1.0)
            textView.text = "Goal has been reached! Claim your reward."
        }
        else{
            progressBar.value = CGFloat(percentage)
            progressBarz.progress = CGFloat(percentage)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
