//
//  ViewController.swift
//  HelloWorld
//
//  Created by 魔法少女赵志辉 on 2020/9/15.
//  Copyright © 2020 魔法少女赵志辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.setTitle("OFF", for: .normal)
        background.backgroundColor = UIColor.black
    }
    
    var isOn = false
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet var background: UIView!
    
    @IBAction func touchUp() {
        if (isOn) {
            button.setTitle("OFF", for: .normal)
            background.backgroundColor = UIColor.black
        }
        else {
            button.setTitle("ON", for: .normal)
            background.backgroundColor = UIColor.white
        }
        isOn = !isOn
    }
}

