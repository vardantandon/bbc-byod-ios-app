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

class LoginViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var appField: UIPickerView!

    //@IBOutlet weak var appname: UITextField!
    
    var username: String = "delia"
    var app: String = "this is an app"
    
    var colors = ["Adobe Reader","BBC weather","BBC News","BBC Weather"]
    let TopAppURL = "https://comp2014group1.herokuapp.com/apps.json"
    var picked: String = "defult"
    var apps = [String]()
    //var delegate: LoginViewControllerDelegate?
    override func viewDidLoad() {
        
        
        
        DataManager.getTopAppsDataFromAppsWithSuccess { (ByodData) -> Void in
            let json = JSON(data: ByodData)
            if let appArray = json.array{
                
                for appDict in appArray {
                    var appName: String = appDict["name"].stringValue
                    self.apps.append(appName)
                }
                     println(self.apps)
                self.appField.reloadAllComponents()
            }
            
        }
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

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.apps.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return "\(self.apps[row])"
        
    }
  /*
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        
        picked = apps[row]
       
    }
*/
    
    @IBAction func submitButton(sender: AnyObject) {
        
        
        if(usernameTextField.text == "" ){
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
           // vc.appName = picked
            vc.username = usernameTextField.text
        }
    }
    
}
