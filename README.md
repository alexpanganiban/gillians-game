# gillians-game

login screen code!

//
//  LoginPageViewController.swift
//  LoginDemo
//
//  Created by Alex Panganiban on 4/7/16.
//  Copyright © 2016 Alex Panganiban. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var childInitialsTextField: UITextField!

    @IBOutlet weak var childBirthdateTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let childInitials = childInitialsTextField.text;
        let childBirthdate = childBirthdateTextField.text;
        let emailAddress = emailAddressTextField.text;
        
        print (childInitials);
        print (childBirthdate);
        print (emailAddress);
        
        //check empty fields
        
        if(childInitials == "" || childBirthdate == "" || emailAddress == "") {
            
            //display alert message
            
            displayAlertMessage("All fields are required");
            return;
        }
        
        //check birthdate format

        if(Int((Array(arrayLiteral: childBirthdate))[0]!) > 1){
            displayAlertMessage("Incorrect birthdate");
            return;
        }
        

        
        
        
        //store field data
        NSUserDefaults.standardUserDefaults().setObject(childInitials, forKey: "childInitials");
        NSUserDefaults.standardUserDefaults().setObject(childBirthdate, forKey: "childBirthdate");
        NSUserDefaults.standardUserDefaults().setObject(emailAddress, forKey: "emailAddress");
        
        
    }
    
    func displayAlertMessage(userMessage: String) {
 
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
 
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
