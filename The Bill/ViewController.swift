//
//  ViewController.swift
//  The Bill
//
//  Created by Stephan Charbit on 8/15/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var BillView: UIView!
    @IBOutlet weak var TipView: UIView!
    @IBOutlet weak var TotalView: UIView!
    @IBOutlet weak var heart_1: UIImageView!
    @IBOutlet weak var heart_2: UIImageView!
    @IBOutlet weak var heart_3: UIImageView!
    @IBOutlet weak var heart_4: UIImageView!
    @IBOutlet weak var AnimationView: UIView!
    @IBOutlet weak var ServiceView: UIView!
    var firstUseFlag:Int = 0
    let tipPercentages = [0.175, 0.2, 0.25]
    let tipPercentageValues = ["(@ 17.5%)", "(@ 20%)", "(@ 25%)"]
    let UIColors = [
        UIColor(red: 0.1, green: 0.2, blue: 0.25, alpha: 1.0),
        UIColor(red: 0.05, green: 0.35, blue: 0.45, alpha: 1.0),
        UIColor(red: 0.0, green: 0.5, blue: 0.6, alpha: 1.0)]
    
    override func viewDidLoad() {
        billField.becomeFirstResponder()
        super.viewDidLoad()
        self.TipView.alpha = 0
        self.BillView.alpha = 0
        self.TotalView.frame.origin.y = 667
        self.ServiceView.alpha = 0
        self.view.backgroundColor = UIColors[2]
        UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveEaseOut, animations: {
            self.BillView.alpha = 1
            
        })
        // Do any additional setup after loading the view, typically from a nib.
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }

    @IBAction func onTapping(_ sender: AnyObject) {
        view.endEditing(true)

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func endEditing(_ sender: AnyObject) {
        print("Hello")
        billField.becomeFirstResponder()
        
    }
    @IBAction func showKeyboard(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let tipPercentageValue = tipPercentageValues[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipPercentage.text = String(tipPercentageValue)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if firstUseFlag == 0{
            revealUI()
        }
        firstUseFlag += 1
    }

    func revealUI(){
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.ServiceView.alpha = 1
        })
        UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveEaseOut, animations: {
            self.TipView.alpha = 1
        })

        UIView.animate(withDuration: 0.6, delay: 0.6, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.TotalView.frame.origin.y = 322
            }, completion:nil)
    }
    
    
    @IBAction func changeUIColor(_ sender: AnyObject) {
        let newUIColor = UIColors[tipControl.selectedSegmentIndex]
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
            self.view.backgroundColor = newUIColor})
    }
    
    @IBAction func showLove(_ sender: AnyObject) {
        // Animate Heart
        if tipControl.selectedSegmentIndex == 1 {
            self.heart_1.frame.origin.y = 60
        self.heart_1.alpha = 0
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseOut, animations: {
            self.heart_1.frame.origin.y = 0
            }, completion:nil)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.heart_1.alpha = 1
            }, completion: { finished in
                self.fadeOut(self.heart_1)
        })
        }
    }
    @IBAction func showMuchLove(_ sender: AnyObject) {
        if tipControl.selectedSegmentIndex == 2 {
        resetPosition(self.heart_2)
        resetPosition(self.heart_3)
        resetPosition(self.heart_4)
            // Animate 3 Hearts
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseOut, animations: {
            self.heart_2.frame.origin.y = 0
            }, completion:nil)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.heart_2.alpha = 1
            }, completion: { finished in
                self.fadeOut(self.heart_2)
        })
        UIView.animate(withDuration: 0.6, delay: 0.3, options: .curveEaseOut, animations: {
            self.heart_3.frame.origin.y = 0
            }, completion:nil)
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.heart_3.alpha = 1
            }, completion: { finished in
                self.fadeOut(self.heart_3)
        })
        UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveEaseOut, animations: {
            self.heart_4.frame.origin.y = 0
            }, completion:nil)
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.heart_4.alpha = 1
            }, completion: { finished in
                self.fadeOut(self.heart_4)
        })
        }
        
    }
    

    func fadeOut(_ sender:UIImageView){
        UIView.animate(withDuration: 0.6, animations: {
            sender.alpha = 0
        })
    }
    func resetPosition(_ sender:UIImageView){
        sender.alpha = 0
        sender.frame.origin.y = 60
    }


}

