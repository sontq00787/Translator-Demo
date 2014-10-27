//
//  ViewController.swift
//  TranslatorDemo
//
//  Created by SonTQ on 10/27/14.
//  Copyright (c) 2014 SYS Vietnam CoLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cpicker: UIPickerView!
    var listCountriesAvaiable : [String]!
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //fetch all countries available
        getListCountryAvailable()
        
        //declare action when touch to myLabel
        var labelTap = UITapGestureRecognizer(target: self, action: "togglePicker")
        myLabel.userInteractionEnabled = true;
        myLabel.addGestureRecognizer(labelTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func togglePicker(){
        if ((cpicker) != nil) {
            cpicker.hidden = !cpicker.hidden
        }
    }
    //MARK: - Fetch countries
    func getListCountryAvailable(){
        var languageDict : NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("language", ofType: "plist"){
            languageDict = NSDictionary(contentsOfFile: path)
        }
        
        if let language = languageDict{
             listCountriesAvaiable = language.allKeys as Array<String>
        }
        
        func inOrder(s1: String, s2: String) -> Bool{
            return s1 < s2;
        }
        
        listCountriesAvaiable = sorted(listCountriesAvaiable, inOrder)
        
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listCountriesAvaiable.count
    }
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return listCountriesAvaiable[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = listCountriesAvaiable[row]
        cpicker.hidden = true;
    }
}

