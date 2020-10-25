//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 魔法少女赵志辉 on 2020/10/26.
//

import Foundation

class Calculator {
    var whatsOnScreen:String = "0"
    var inputBuffer:[Character] = []
    var stack:[String] = ["0"]
    var isAfterEqual:Bool = false
    
    static func isDigit(_ ch:Character) -> Bool {
        return ch == "0" || ch == "1" || ch == "2" || ch == "3" || ch == "4" || ch == "5" || ch == "6" || ch == "7" || ch == "8" || ch == "9" || ch == "."
    }
    
    static func isOperator(_ str:String?) -> Bool {
        return str == "+" || str == "-" || str == "×" || str == "÷" || str == "="
    }
    
    func inputDigit(_ ch:Character) -> (Bool, String?) {
        if (isAfterEqual) {
            // discard former result and start new session
            assert(inputBuffer.isEmpty)
            stack = []
            isAfterEqual = false
        }
        
        // check input validity of input digit
        if (inputBuffer == ["0"] && ch == "0") {
            return (false, "Shouldn't enter '0' consecutively.")
        }
        else if (inputBuffer.contains(".") && ch == ".") {
            return (false, "Can't enter more than one '.' in a number.")
        }
        
        if (inputBuffer == ["0"] && Calculator.isDigit(ch)) {
            // use digit to substitude the default "0"
            inputBuffer = [ch]
        }
        else {
            inputBuffer.append(ch)
        }
        whatsOnScreen = String(inputBuffer)
        return (true, nil)
    }
    
    func inputOperator(_ ch:Character) -> (Bool, String?) {
        if (isAfterEqual) {
            isAfterEqual = false
        }
        
        if (!inputBuffer.isEmpty) {
            if (stack.last == "0") {
                // substitude default "0"
                stack = [String(inputBuffer)]
            }
            else {
                stack.append(String(inputBuffer))
            }
            inputBuffer = []
        }
        
        if (Calculator.isOperator(stack.last)) {
            return (false, "Can't enter operators consecutively.")
        }
        
        if (stack.count == 3) {
            let a:Double = Double(stack[0])!
            let b:Double = Double(stack[2])!
            var res:Double = 0.0
            switch stack[1] {
            case "+":
                res = a + b
            case "-":
                res = a - b
            case "×":
                res = a * b
            case "÷":
                res = a / b
            default:
                break
            }
            
            stack = []
            stack.append(String(res))
            whatsOnScreen = String(res)
        }
        
        if (ch != "=") {
            stack.append(String(ch))
        }
        else {
            isAfterEqual = true
        }
       
        return (true, nil)
    }
    
    func getScreen() -> String {
        return whatsOnScreen
    }
    
    func reset() {
        whatsOnScreen = "0"
        inputBuffer = []
        stack = ["0"]
        isAfterEqual = false
    }
}
