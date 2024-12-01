//
//  SpeedViewController.swift
//  UnitConverter
//
//  Created by Mac on 8/13/18.
//  Copyright © 2018 Athiththan. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var metreSecTextField: UITextField!
    @IBOutlet var feetMinTextField: UITextField!
    @IBOutlet var kmHourTextField: UITextField!
    @IBOutlet var mileHourTextField: UITextField!
    
    // Speed Converter
    let speedConverter = SpeedConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hide keyboard
        self.hideKeyboard()
        
        self.metreSecTextField.delegate = self
        self.feetMinTextField.delegate = self
        self.kmHourTextField.delegate = self
        self.mileHourTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func metreSecChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let metreSec = Double(value)
            let values = speedConverter.metreSecConverter(metre: metreSec!)
            
            feetMinTextField.text = String(values.feet)
            kmHourTextField.text = String(values.km)
            mileHourTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func feetMinChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let feetMin = Double(value)
            let values = speedConverter.feetMinConverter(feet: feetMin!)
            
            metreSecTextField.text = String(values.metre)
            kmHourTextField.text = String(values.km)
            mileHourTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func kmHourChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kmHour = Double(value)
            let values = speedConverter.kmHourConverter(km: kmHour!)
            
            metreSecTextField.text = String(values.metre)
            feetMinTextField.text = String(values.feet)
            mileHourTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func mileHourChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let mileHour = Double(value)
            let values = speedConverter.mileHourConverter(mile: mileHour!)
            
            metreSecTextField.text = String(values.metre)
            feetMinTextField.text = String(values.feet)
            kmHourTextField.text = String(values.km)
            
        }else{
            resetFields()
        }
    }
    
    func resetFields() -> () {
        metreSecTextField.text = ""
        feetMinTextField.text = ""
        kmHourTextField.text = ""
        mileHourTextField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
}
