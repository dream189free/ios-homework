//
//  ViewController.swift
//  Calculator
//
//  Created by 魔法少女赵志辉 on 2020/10/25.
//

import UIKit

class ViewController: UIViewController {
    var calculator:Calculator? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculator = Calculator()
    }

    @IBOutlet weak var screen: UITextField!
    
    @IBAction func digitTouched(_ sender: UIButton) {
        let res = calculator?.inputDigit((sender.currentTitle?.first)!)
        if (res?.0 == false) {
            let alert = UIAlertController(title: "Error", message: res?.1, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            screen.text = calculator?.getScreen()
        }
    }
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        let res = calculator?.inputOperator((sender.currentTitle?.first)!)
        if (res?.0 == false) {
            let alert = UIAlertController(title: "Error", message: res?.1, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            screen.text = calculator?.getScreen()
        }
    }
    
    @IBAction func resetTouched(_ sender: UIButton) {
        calculator?.reset()
        screen.text = calculator?.getScreen()
    }
}

