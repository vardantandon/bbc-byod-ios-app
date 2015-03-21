//
//  LoginViewController.swift
//  FeedbackApp
//
//  Created by Delia Gander on 09/03/2015.
//  Copyright (c) 2015 Delia Gander. All rights reserved.
//

import UIKit
//
//protocol LoginViewControllerDelegate{
//    func didSubmitAppText(appText:String, forUsername username:String)
//}

class LoginViewController: UIViewController {
   
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var appTextField: UITextField!
    var username: String = "delia"
    var app: String = "this is an app"
    
    
    //var delegate: LoginViewControllerDelegate?
    override func viewDidLoad() {
        
    }
    
    
//    func setUsername(user: String){
//      username = user
//    }
//    func setApp(application: String){
//        app = application
//    }
    
//    func getUsername() -> String{
//        
//        return username;
//    }
//    func getApp() -> String{
//        
//        return app;
//    }
    
    @IBAction func submitButton(sender: AnyObject) {
        
        if(usernameTextField.text == "" && appTextField.text == ""){
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Some text fields empty"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        
        
        
    }
    
    
    //MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "submit"{
            let vc = segue.destinationViewController as ViewController
            vc.appName = appTextField.text
            vc.username = usernameTextField.text
        }
    }
    
}
