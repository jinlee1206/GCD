//
//  ViewController.swift
//  GCD
//
//  Created by Euijae Hong on 2018. 8. 27..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalSync()
        globalAsync()
        
  
    }

}

extension ViewController {
    
    /*
     
     블럭처리된 동기 함수이다.
     
     printNumber : 0
     printNumber : 1
     printNumber : 2
     .
     .
     .
     .
     printNumber :  99
     printNumber :  100
     printNumber finish
     finish globalSync
     
     로그를 확인해보면 함수가 끝날때 찍히는 finish globalSync 가 제일 마지막에 불리어진다.
     
    */
    
    fileprivate func globalSync() {

        DispatchQueue.global().sync {
            
            self.printNumber()
            
        }

        print("finish globalSync")

    }
    
    
    /*
     
     논블럭처리된 비동기 함수이다.
     
     finish globalAsync
     printNumber :  0
     printNumber :  1
     printNumber :  2
     .
     .
     .
     .
     printNumber :  99
     printNumber :  100
     printNumber finish
     
     위에 블럭된 동기함수와 다르게 비동기 함수는 finish Func 이 제일먼저 찍히고
     async 클로저 스코프안에있는 함수(printNumber)가 실행되고 프린트문이 찍히게된다.
     
    */
    
    fileprivate func globalAsync() {
        
        DispatchQueue.global().async {
            
            self.printNumber()
            
        }
        
        print("finish globalAsync")
        
    }
    
    
    func printNumber() {

        for i in 0...100 {
            
            print("printNumber : ",i)
            
        }
        
        print("printNumber finish")
        
    }

    
}











