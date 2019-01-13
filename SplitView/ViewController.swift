//
//  ViewController.swift
//  SplitView
//
//  Created by daicudu on 1/10/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var GAI: UIActivityIndicatorView!
    var data1: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        GAI.startAnimating()
//        GAI.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if data1 != nil {
            let imageURl = URL(string: data1!)
            CacheImage.shared.getImage(withURl: imageURl!) { (image) in
                self.imageView.image = image
                self.GAI.isHidden = true
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 10
        return imageView
    }
    
    
}


