//
//  ViewController.swift
//  Custom Drawing App
//
//  Created by Prashant G on 1/4/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }


}

