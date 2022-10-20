//
//  homeViewController.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.07.2022.
//

import UIKit

class homeViewController: BaseViewController {

    private var shortLink: String = ""
    
    @IBOutlet private weak var illustrationImage: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var explanationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "More than just shorter links"
        explanationLabel.text = "Build your brand's recognition and get detailed insights on how your links are performing"
    }
    

    @IBAction func startActionButton(_ sender: Any) {
        
        let PromotionViewController = PromationViewController()
        self.navigationController?.pushViewController(PromotionViewController, animated: true)
//        print(#function)
        
    }
    

}
