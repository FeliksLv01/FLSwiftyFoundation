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

struct Model: Codable {
    @Default<Int>
    var int: Int
    @Default<String>
    var str: String
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonStr = "{\"int1\":123,\"str\": null}"
        let data = jsonStr.data(using: .utf8) ?? Data()
        let model = try? JSONDecoder().decode(Model.self, from: data)
        print(model!.int)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

