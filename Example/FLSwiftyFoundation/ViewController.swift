//
//  ViewController.swift
//  FLSwiftyFoundation
//
//  Created by felikslv on 08/06/2022.
//  Copyright (c) 2022 felikslv. All rights reserved.
//

import UIKit
import RxSwift
import FLSwiftyFoundation

class ViewController: UIViewController {

    let numbers: Observable<Int> = Observable.create { observer -> Disposable in
        observer.onNext(0)
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onNext(4)
        observer.onNext(5)
        observer.onNext(6)
        observer.onNext(7)
        observer.onNext(8)
        observer.onNext(9)
        observer.onCompleted()

        return Disposables.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numbers.subscribe { num in
            print(num)
        } onCompleted: {
            print("complete")
        }.disposed(by: rx.disposeBag)
        
        print(Date().day)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

