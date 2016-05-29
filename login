//
//  LoginPageViewController.swift
//  ALEXforTFC
//
//  Created by Alex Panganiban on 5/24/16.
//  Copyright © 2016 TFC. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    
    func displayAlertMessage(userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
        
    }

    @IBOutlet weak var childInitialsTextField: UITextField!
    @IBOutlet weak var childBirthdateTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let initials = childInitialsTextField.text;
        let birthdate = childBirthdateTextField.text;
        
        //Check empty fields
        if (initials == "" || birthdate == ""){
            //Display alert message
            displayAlertMessage("All fields are required")
            return;
        }
        
        //Check birthdate format
        
        if((Int(String(birthdate![(birthdate?.startIndex.advancedBy(0))!])))>1){
            displayAlertMessage("Incorrect format! Please re-enter the date.");
            return;
        }
        else if ((String(birthdate![(birthdate?.startIndex.advancedBy(2))!])) != "/") {
            displayAlertMessage("Incorrect format! Please re-enter the date.");
            return;
        }
        else if ((Int(String(birthdate![(birthdate?.startIndex.advancedBy(3))!])))>3) {
            displayAlertMessage("Incorrect format! Please re-enter the date.");
            return;
        } else if ((String(birthdate![(birthdate?.startIndex.advancedBy(5))!])) != "/") {
            displayAlertMessage("Incorrect format! Please re-enter the date.");
            return;
        }
        
        //Display alert message with confirmation
        
        var myAlert = UIAlertController(title: "Alert", message: "Registration successful!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Okay",style: UIAlertActionStyle.Default) { action in self.dismissViewControllerAnimated(true, completion: nil);
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "loggedIn");
            NSUserDefaults.standardUserDefaults().synchronize();
        
    }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
}
