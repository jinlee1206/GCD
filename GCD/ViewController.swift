//
//  ViewController.swift
//  GCD
//
//  Created by Euijae Hong on 2018. 8. 27..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        changeValue()
        

    }
    
    



}

extension ViewController {
    
    fileprivate func setupViews() {
        
//        DispatchQueue.global()
        
        DispatchQueue.main.async {
            
        }
        
        DispatchQueue.global().async {
            
            self.view.addSubview(self.imageView)
            self.imageView.backgroundColor = .red
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            self.imageView.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            
        }
        

        
    }
    
    
    fileprivate func changeValue() {
        
        DispatchQueue.main.async {
            
            self.value = 5
            
        }
        
        
        
    }
    
}



