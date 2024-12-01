//
//  WeightViewController.swift
//  UnitConverter
//
//  Created by Mac on 8/13/18.
//  Copyright © 2018 Athiththan. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
}

extension String {
    func isValidDouble(maxDecimalPlaces: Int) -> Bool {

        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."
        
        if formatter.number(from: self) != nil {
            let split = self.components(separatedBy: decimalSeparator)
            let digits = split.count == 2 ? split.last ?? "" : ""
            return digits.count <= maxDecimalPlaces
        }
        return false
    }
}

class WeightViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var gramTextField: UITextField!
    @IBOutlet var kgTextField: UITextField!
    @IBOutlet var poundTextField: UITextField!
    @IBOutlet var ounceTextField: UITextField!
    
    // Weight Converter
    let weightConverter = WeightConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hide decimal pad
        self.hideKeyboard()
        
        self.gramTextField.delegate = self
        self.kgTextField.delegate = self
        self.poundTextField.delegate = self
        self.ounceTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gramChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let gram = Double(value)
            let values = weightConverter.gramConverter(gram: gram!)

            kgTextField.text = String(values.kg)
            poundTextField.text = String(values.pound)
            ounceTextField.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func kgChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kg = Double(value)
            let values = weightConverter.kgConverter(kg: kg!)
            
            gramTextField.text = String(values.gram)
            poundTextField.text = String(values.pound)
            ounceTextField.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func poundChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let pound = Double(value)
            let values = weightConverter.poundConverter(pound: pound!)
            
            gramTextField.text = String(values.gram)
            kgTextField.text = String(values.kg)
            ounceTextField.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func ounceChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let ounce = Double(value)
            let values = weightConverter.ounceConverter(ounce: ounce!)
            
            gramTextField.text = String(values.gram)
            kgTextField.text = String(values.kg)
            poundTextField.text = String(values.pound)
            
        }else{
            resetFields()
        }
    }
    
    func resetFields() -> () {
        gramTextField.text = ""
        kgTextField.text = ""
        poundTextField.text = ""
        ounceTextField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
    
}

