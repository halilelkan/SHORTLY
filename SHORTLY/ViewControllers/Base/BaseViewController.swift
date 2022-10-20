//
//  BaseViewController.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.07.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        
        
    }
    
    
}

