//
//  MainScreen.swift
//  Calculator
//
//  Created by Decagon on 10/29/21.
//

import UIKit


enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Percentage = "%"
case PlusMinus = "±"
    case NULL = "NULL"
    
    
}


class MainScreen: UIViewController {
    
    var initialValue = ""
    var leftOperand = ""
    var rightOperand = ""
    var output = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        result.text = "0"
    }
    
    
    
    @IBAction func digitButton(_ sender: UIButton) {
         
        if initialValue.count <= 20 {
        initialValue += "\((sender as AnyObject).tag ?? Int(initialValue)!)"
        result.text = initialValue
        }
    }
    
    
    @IBAction func decimalButton(_ sender: UIButton) {
        if initialValue.count <= 19 && !initialValue.contains(".") {
        initialValue += "."
        result.text = initialValue
        }
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        basicOperation(currentOperation)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        basicOperation(.Add)
    }
    @IBAction func subtractButton(_ sender: UIButton) {
        basicOperation(.Subtract)
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        basicOperation(.Multiply)
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        basicOperation(.Divide)
    }
    @IBAction func percentageButton(_ sender: UIButton) {
        basicOperation(.Percentage)
    }
    //    enum Operator {
    @IBAction func plusMinusButton(_ sender: UIButton) {
        
        basicOperation(.PlusMinus)
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        
         initialValue = ""
         leftOperand = ""
         rightOperand = ""
         output = ""
         currentOperation = .NULL
        result.text = "0"
    }
    
    @IBOutlet weak var result: UILabel!
    
    

    func basicOperation(_ operation:Operation){

        if currentOperation != .NULL && initialValue.last != "."  {
            
            if initialValue != "" && initialValue.last != "." {
                rightOperand = initialValue
                initialValue = ""
                
                switch currentOperation {
                case .Add:
                    output = "\((Double(leftOperand) ?? 0.0)  + (Double(rightOperand) ?? 0.0))"
                case .Subtract:
                    output = "\((Double(leftOperand) ?? 0.0) - (Double(rightOperand) ?? 0.0))"
                case .Divide:
                    output = "\((Double(leftOperand) ?? 0.0) / (Double(rightOperand) ?? 0.0))"
                case .Multiply:
                    output = "\((Double(leftOperand) ?? 0.0) * (Double(rightOperand) ?? 0.0))"
                case .Percentage:
                    output = "\((Double(leftOperand) ?? 0.0) * ((Double(rightOperand) ?? 1.0) / 100))"
                case .PlusMinus:
                    if (Double(leftOperand) ?? 0.0) > 0.0 {
                        output = "\(Double(leftOperand)! * (-1))"
                    }
                case .NULL:
                    if leftOperand.count <= 19 && !leftOperand.contains(".") {
                    leftOperand += "."
                    output = leftOperand
                    }
                }
                
              
                
                leftOperand = output
                if (Double(output)!.truncatingRemainder(dividingBy: 1) == 0){
                    output = "\(Int(Double(output)!))"
                }
                result.text = output
                
            }
            
            currentOperation = operation
            
        } else {
            leftOperand = initialValue
            initialValue = ""
            currentOperation = operation
        }


    }
}
