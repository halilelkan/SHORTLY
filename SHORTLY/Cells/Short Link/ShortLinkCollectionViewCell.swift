//
//  ShortLinkCollectionViewCell.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 24.07.2022.
//

import UIKit

class ShortLinkCollectionViewCell: UICollectionViewCell {
    
    var removeActionButton : (() -> Void)?
    var copyActionButton : (() -> Void)?

    @IBOutlet weak var shortLinkLabel: UILabel!
    @IBOutlet weak var orgLinkLabel: UILabel!
    
    
    
    func configur(with shortLink: shortLinkResponse) {
        
        shortLinkLabel.text = shortLink.short_link
        orgLinkLabel.text = shortLink.original_link
        
    }
    
    
    @IBAction func copyActionButton(_ sender: Any) {
        
//        print(#function)
        self.copyActionButton?()
    }
    
    @IBAction func removeActionButton(_ sender: Any) {
        
//        print(#function)
        self.removeActionButton?()
    }
    

}
