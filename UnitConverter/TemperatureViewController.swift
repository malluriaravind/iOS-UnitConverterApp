//
//  TemperatureViewController.swift
//  UnitConverter
//
//  Created by Mac on 8/13/18.
//  Copyright © 2018 Athiththan. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusTextField: UITextField!
    @IBOutlet var fahrenheitTextField: UITextField!
    @IBOutlet var kelvinTextField: UITextField!
    
    // Temperature Converter
    let temperatureConverter = TemperatureConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hide decimal pad
        self.hideKeyboard()
        
        self.celsiusTextField.delegate = self
        self.fahrenheitTextField.delegate = self
        self.kelvinTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func celsiusChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let celsius = Double(value)
            let values = temperatureConverter.celsiusConverter(celsius: celsius!)
            
            fahrenheitTextField.text = String(values.fahrenheit)
            kelvinTextField.text = String(values.kelvin)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func fahrenheitChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let fahrenheit = Double(value)
            let values = temperatureConverter.fahrenheitConverter(fahrenheit: fahrenheit!)
            
            celsiusTextField.text = String(values.celsius)
            kelvinTextField.text = String(values.kelvin)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func kelvinChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kelvin = Double(value)
            let values = temperatureConverter.kelvinConverter(kelvin: kelvin!)
            
            celsiusTextField.text = String(values.celsius)
            fahrenheitTextField.text = String(values.fahrenheit)
            
        }else{
            resetFields()
        }
    }
    
    func resetFields() -> () {
        celsiusTextField.text = ""
        fahrenheitTextField.text = ""
        kelvinTextField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
}


