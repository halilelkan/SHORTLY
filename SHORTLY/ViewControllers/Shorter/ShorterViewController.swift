//
//  ShorterViewController.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 24.07.2022.
//

import UIKit

class ShorterViewController: BaseViewController {
    
    @IBOutlet weak var shortLinkCollectionView: UICollectionView!
    
    @IBOutlet private weak var shapeImageView: UIImageView!
    @IBOutlet private weak var urlTextField: UITextField!
    @IBOutlet private weak var illustrationImageView: UIImageView!
    @IBOutlet private weak var shorterTitleLabel: UILabel!
    @IBOutlet private weak var shorterDescLabel: UILabel!
    
    
    private var shortLinkList = [shortLinkResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shorterTitleLabel.text = "Let's get started!"
        shorterDescLabel.text = "Paste your first link into the field to shorten it"
        
        shortLinkCollectionView.dataSource = self
        shortLinkCollectionView.delegate = self
        
        let nib = UINib(nibName: "ShortLinkCollectionViewCell", bundle: nil)
        shortLinkCollectionView.register(nib, forCellWithReuseIdentifier: "ShortLinkCollectionViewCell")
        
        touchDetection()
    }



    @IBAction func shortenItActionButton(_ sender: Any) {
        shortenLink()
//        print(#function)
    }
    
    func animated(){
        illustrationImageView.isHidden = true
        shorterTitleLabel.isHidden = true
        shorterDescLabel.isHidden = true
    }
    
    func touchDetection(){
        let touchDetection = UITapGestureRecognizer(target: self, action: #selector(self.touchDetectionMethod))
        view.addGestureRecognizer(touchDetection)
}
    @objc func touchDetectionMethod(){
           view.endEditing(true)
      }
    
    func shortenLink() {
        guard let link = urlTextField.text else { return }
       
        let network = Network()
        network.request(endpointType: .shorten(link: link)) { [self] (result: Result<BaseResponse<shortLinkResponse>, CustomError>) in
            
            switch result {
            case .success(let response):
                print(response)
                
                guard let responseShortLinkList = response.result else {
                    
                    let errorMessage = ErrorMessageAlert()
                    let errorCode = response.error_code ?? 1
                    
                    errorMessage.dene(errorCode: errorCode)
                    let errorMesage = errorMessage.errorMessage
                    
                   print(errorMesage)
                    let alertController = UIAlertController(title: "", message: errorMesage, preferredStyle: .alert)
                   
                    let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) {
                        action in
                        
                    }
                    DispatchQueue.main.async {
                        alertController.addAction(tamamAction)
                        
                        self.present(alertController,animated: true)
                    }
                    
                    return
                }
                
                self.shortLinkList += [responseShortLinkList] as! [shortLinkResponse]
                
                DispatchQueue.main.async {
                    self.animated()
                    self.shortLinkCollectionView.reloadData()
                }
                
            case .failure(let error):
                print(error.message)
            }
            
        }
        
    }
    
}


extension ShorterViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortLinkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShortLinkCollectionViewCell", for: indexPath) as! ShortLinkCollectionViewCell
        
        let shortLinkList = shortLinkList[indexPath.row]
        
        cell.configur(with: shortLinkList)
        
        cell.copyActionButton = {
            
            guard let copyLink = shortLinkList.short_link else{ return }
            UIPasteboard.general.string = copyLink
            
        }
        
        cell.removeActionButton = {
            
            self.shortLinkList.remove(at: indexPath.row)
            DispatchQueue.main.async {
                self.shortLinkCollectionView.reloadData()
                if self.shortLinkList.count == 0{
                    
                    self.illustrationImageView.isHidden = false
                    self.shorterTitleLabel.isHidden = false
                    self.shorterDescLabel.isHidden = false
                }
            }
            
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = self.view.frame.width
        let heigth: CGFloat = 140
        
        return CGSize(width: width, height: heigth)
    }
}
