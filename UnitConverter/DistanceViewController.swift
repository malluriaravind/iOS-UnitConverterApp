//
//  DistanceViewController.swift
//  UnitConverter
//
//  Created by Mac on 8/13/18.
//  Copyright © 2018 Athiththan. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var metreTextField: UITextField!
    @IBOutlet var footTextField: UITextField!
    @IBOutlet var yardTextField: UITextField!
    @IBOutlet var kmTextField: UITextField!
    @IBOutlet var mileTextField: UITextField!
    
    // Distance Converter
    let distanceConverter = DistanceConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hide keyboard
        self.hideKeyboard()
        
        self.metreTextField.delegate = self
        self.footTextField.delegate = self
        self.yardTextField.delegate = self
        self.kmTextField.delegate = self
        self.mileTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func metreChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let metre = Double(value)
            let values = distanceConverter.metreConverter(metre: metre!)
            
            footTextField.text = String(values.foot)
            yardTextField.text = String(values.yard)
            kmTextField.text = String(values.km)
            mileTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func footChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let foot = Double(value)
            let values = distanceConverter.footConverter(foot: foot!)
            
            metreTextField.text = String(values.metre)
            yardTextField.text = String(values.yard)
            kmTextField.text = String(values.km)
            mileTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func yardChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let yard = Double(value)
            let values = distanceConverter.yardConverter(yard: yard!)
            
            metreTextField.text = String(values.metre)
            footTextField.text = String(values.foot)
            kmTextField.text = String(values.km)
            mileTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func kmChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let km = Double(value)
            let values = distanceConverter.kmConverter(km: km!)
            
            metreTextField.text = String(values.metre)
            footTextField.text = String(values.foot)
            yardTextField.text = String(values.yard)
            mileTextField.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func mileChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let mile = Double(value)
            let values = distanceConverter.mileConverter(mile: mile!)
            
            metreTextField.text = String(values.metre)
            footTextField.text = String(values.foot)
            yardTextField.text = String(values.yard)
            kmTextField.text = String(values.km)
            
        }else{
            resetFields()
        }
    }
    
    func resetFields() -> () {
        metreTextField.text = ""
        footTextField.text = ""
        yardTextField.text = ""
        kmTextField.text = ""
        mileTextField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
}
