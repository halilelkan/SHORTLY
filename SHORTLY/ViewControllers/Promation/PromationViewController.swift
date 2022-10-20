//
//  PromationViewController.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.10.2022.
//

import UIKit
import ImageSlideshow

class PromationViewController: BaseViewController {

    @IBOutlet weak var sliderImageView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewDesign()
        checkUI()
    }
    
//      MARK: - Slider imageView
    
    func checkUI(){
        sliderImageView.setImageInputs([
            ImageSource(image: UIImage(named: "slider1")!),
            ImageSource(image: UIImage(named: "slider2")!),
            ImageSource(image: UIImage(named: "slider3")!),
        ])
    }
    
//      MARK: - Page sliderView
    
    func pageViewDesign(){
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        sliderImageView.pageIndicator = pageIndicator
        sliderImageView.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .customBottom(padding: 0))
        pageIndicator.bounds.size.width = 3.0
        pageIndicator.currentPage = 4
        
        sliderImageView.activityIndicator = DefaultActivityIndicator()
        sliderImageView.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    @IBAction func skipActionButton(_ sender: Any) {
        let ShorterViewController = ShorterViewController()
        self.navigationController?.pushViewController(ShorterViewController, animated: true)
//        print(#function)
    }
}
