//
//  ViewController.swift
//  MiraclePill
//
//  Created by Matthias Hofmann on 02.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var pillsView: UIImageView!
    @IBOutlet weak var miraclePillsLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var successIndicator: UIImageView!
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    let states = ["Choose Your State",
                  "AK - Alaska",
                  "AL - Alabama",
                  "AR - Arkansas",
                  "AS - American Samoa",
                  "AZ - Arizona",
                  "CA - California",
                  "CO - Colorado",
                  "CT - Connecticut",
                  "DC - District of Columbia",
                  "DE - Delaware",
                  "FL - Florida",
                  "GA - Georgia",
                  "GU - Guam",
                  "HI - Hawaii",
                  "IA - Iowa",
                  "ID - Idaho",
                  "IL - Illinois",
                  "IN - Indiana",
                  "KS - Kansas",
                  "KY - Kentucky",
                  "LA - Louisiana",
                  "MA - Massachusetts",
                  "MD - Maryland",
                  "ME - Maine",
                  "MI - Michigan",
                  "MN - Minnesota",
                  "MO - Missouri",
                  "MS - Mississippi",
                  "MT - Montana",
                  "NC - North Carolina",
                  "ND - North Dakota",
                  "NE - Nebraska",
                  "NH - New Hampshire",
                  "NJ - New Jersey",
                  "NM - New Mexico",
                  "NV - Nevada",
                  "NY - New York",
                  "OH - Ohio",
                  "OK - Oklahoma",
                  "OR - Oregon",
                  "PA - Pennsylvania",
                  "PR - Puerto Rico",
                  "RI - Rhode Island",
                  "SC - South Carolina",
                  "SD - South Dakota",
                  "TN - Tennessee",
                  "TX - Texas",
                  "UT - Utah",
                  "VA - Virginia",
                  "VI - Virgin Islands",
                  "VT - Vermont",
                  "WA - Washington",
                  "WI - Wisconsin", 
                  "WV - West Virginia", 
                  "WY - Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
        nameTextField.delegate = self;
        streetTextField.delegate = self;
        zipCodeTextField.delegate = self;
        countryTextField.delegate = self;
        cityTextField.delegate = self;
        
        successIndicator.isHidden = true
        backBtn.isHidden = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.subscribeToKeyboardNotifications()
        self.subscribeToKeyboardWillHideNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.unsubscribeFromKeyboardNotifications()
        self.unsubscribeFromKeyboardWillHideNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBActions
    
    @IBAction func stateBtnPressed(_ sender: AnyObject) {
        
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        buyNowBtn.isHidden = true
        
    }

    @IBAction func buyBtnPressed(_ sender: AnyObject) {

        statePicker.isHidden = true
        statePickerBtn.isHidden = true
        pillsView.isHidden = true
        miraclePillsLabel.isHidden = true
        moneyLabel.isHidden = true
        nameLabel.isHidden = true
        nameTextField.isHidden = true
        streetLabel.isHidden = true
        streetTextField.isHidden = true
        cityLabel.isHidden = true
        cityTextField.isHidden = true
        stateLabel.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        buyNowBtn.isHidden = true
        divider.isHidden = true
        
        successIndicator.isHidden = false
        backBtn.isHidden = false

    }
    
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        
        statePicker.isHidden = true
        statePickerBtn.isHidden = false
        pillsView.isHidden = false
        miraclePillsLabel.isHidden = false
        moneyLabel.isHidden = false
        nameLabel.isHidden = false
        nameTextField.isHidden = false
        streetLabel.isHidden = false
        streetTextField.isHidden = false
        cityLabel.isHidden = false
        cityTextField.isHidden = false
        stateLabel.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        buyNowBtn.isHidden = false
        divider.isHidden = false
        
        successIndicator.isHidden = true
        backBtn.isHidden = true
        
        // clear textfield
        nameTextField.text = ""
        streetTextField.text = ""
        cityTextField.text = ""
        zipCodeTextField.text = ""
        countryTextField.text = ""
        
        statePickerBtn.setTitle(states[0], for: UIControlState.normal)
        
    }
    
    // MARK: Picker Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
        buyNowBtn.isHidden = false

    }
    
    // MARK: Keyboard Methods
    
    // close keyboard when user tap outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // close keyboard when user presses return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Show and Hide Keyboard
    
    func keyboardWillShow(notification: NSNotification) {
        if countryTextField.isFirstResponder {
            // move stackview up
            self.stackView.frame.origin.y -= getKeyboardHeight(notification: notification)
            // disable other textFields and buttons
            nameTextField.isUserInteractionEnabled = false
            streetTextField.isUserInteractionEnabled = false
            cityTextField.isUserInteractionEnabled = false
            zipCodeTextField.isUserInteractionEnabled = false
            buyNowBtn.isUserInteractionEnabled = false
            statePickerBtn.isUserInteractionEnabled = false
        }
        if zipCodeTextField.isFirstResponder {
            // move stackview up
            self.stackView.frame.origin.y -= getKeyboardHeight(notification: notification)
            // disable other textFields and buttons
            nameTextField.isUserInteractionEnabled = false
            streetTextField.isUserInteractionEnabled = false
            cityTextField.isUserInteractionEnabled = false
            countryTextField.isUserInteractionEnabled = false
            buyNowBtn.isUserInteractionEnabled = false
            statePickerBtn.isUserInteractionEnabled = false
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if countryTextField.isFirstResponder || zipCodeTextField.isFirstResponder {
            // reset stackView position
            self.stackView.frame.origin.y = 0
            // enable all textFields
            nameTextField.isUserInteractionEnabled = true
            streetTextField.isUserInteractionEnabled = true
            cityTextField.isUserInteractionEnabled = true
            countryTextField.isUserInteractionEnabled = true
            zipCodeTextField.isUserInteractionEnabled = true
            buyNowBtn.isUserInteractionEnabled = true
            statePickerBtn.isUserInteractionEnabled = true
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }

    // MARK: KeyboardNotifications
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func subscribeToKeyboardWillHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardWillHideNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
}

