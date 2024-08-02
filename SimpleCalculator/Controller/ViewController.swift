//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Karthikeyan.L on 02/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var MulpButton: UIButton!
    @IBOutlet weak var divnButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        // Do any additional setup after loading the view.
        
        // Add tap gesture recognizer to the view
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true) // Hides the keyboard
        }
    
    
    
    @IBAction func CalculateButtonPressed(_ sender: UIButton) {
        
       
        
        // used for selection the Button which user selecting
        plusButton.isSelected = false
        minusButton.isSelected = false
        MulpButton.isSelected = false
        divnButton.isSelected = false
        sender.isSelected = true
        
        
        if let selectedOperations = sender.titleLabel?.text {
            
            if let firstTextFld = firstTextField.text , let secondTextFld = secondTextField.text {
                
                
              // for textfield1 nil validation handled
                if firstTextFld == "" && secondTextFld == "" {
                    errorLabel.isHidden = false
                    errorLabel.text = "Please Enter both the TextField"
                } else if firstTextFld == "" {
                    errorLabel.isHidden = false
                    errorLabel.text = "Please Enter First Number."
                } else if secondTextFld == "" {
                    errorLabel.isHidden = false
                    errorLabel.text = "Please Enter Second Number."
                }  else {
                    
                    if selectedOperations == "+" {
                        let result = Double(firstTextFld)! + Double(secondTextFld)!
                        errorLabel.isHidden = true
                        answerLabel.text = String(format: "%.1f", result)
                        print("The addition value: \(result)")
                        //Addition
                    }
                    else if selectedOperations == "-" {
                        let result =  Double(firstTextFld)! - Double(secondTextFld)!
                        errorLabel.isHidden = true
                        answerLabel.text = String(format: "%.1f", result)
                        print("The subtraction value: \(result)")
                        //Subtraction
                    }
                    else if selectedOperations == "x" {
                        let result =  Double(firstTextFld)! * Double(secondTextFld)!
                        errorLabel.isHidden = true
                        answerLabel.text = String(format: "%.1f", result)
                        print("The multiplication value: \(result)")
                        //Multiplication
                    }
                    else if selectedOperations == "/" {
                        
                        // Check for division by zero
                        guard Double(secondTextFld) != 0 else {
                            errorLabel.isHidden = false
                            errorLabel.text = "Error: Cannot divide by zero."
                            return
                                }
                        
                        let result =  Double(firstTextFld)! / Double(secondTextFld)!
                        errorLabel.isHidden = true
                        answerLabel.text = String(format: "%.1f", result)
                        print("The multiplication value: \(result)")
                        //Division
                    }
                    
                }
            
            }  
            
            
            
        }
        
    }
    
}



