//
//  AdviceController.swift
//  CapitalOneApp
//
//  Created by Niranjan Senthilkumar on 5/24/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit


class AdviceController: UIViewController {
    
    let textView: UILabel = {
        let tv = UILabel()
        tv.text = "Goal:\nIf you save 20% on\nyour monthly\nincome, you'll get\n3% back."
        tv.numberOfLines = 0
        tv.textAlignment = .center
        tv.adjustsFontSizeToFitWidth = true
        //tv.text = tv.text?.components(separatedBy: .newLines)
        tv.font = UIFont(name: "Avenir-Heavy", size: 38)
        return tv
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Dismiss", attributes: [NSAttributedStringKey.font: UIFont(name: "Avenir-Book", size: 18), NSAttributedStringKey.foregroundColor: UIColor.gray])
                
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    @objc func handleDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 241, blue: 237)
        
        view.addSubview(textView)
        textView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 333, height: 260)
        
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(dismissButton)
        dismissButton.anchor(top: textView.bottomAnchor, left: textView.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 128, paddingBottom: 252, paddingRight: 150, width: 77, height: 33)
    }
}
