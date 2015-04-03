//
//  ViewController.swift
//  FeedbackApp
//
//  Created by Delia Gander on 11/02/2015.
//  Copyright (c) 2015 Delia Gander. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    //var login: LoginViewController!
    struct isUserHappy {
        static var happy = 0
        static var sad = 0
    }
    struct Buttons {
        static var happyButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        static var sadButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    }
    struct Device {
        //static var deviceName: String = UIDevice.currentDevice().name
        static var deviceModel: String = UIDevice.currentDevice().model
        static var deviceSystemName: String = UIDevice.currentDevice().systemName
        static var deviceSystemVersion: String = UIDevice.currentDevice().systemVersion
    }
    
    var net: Net!
    
    var appName: String!
    var username: String!
    var apps = [AppModel]()
    
    override func viewDidLoad() {
        net = Net()
        
        super.viewDidLoad()
        let sad = UIImage(named: "UIButtonsSad.png") as UIImage?
        let happy = UIImage(named: "UIButtonsHappy.png") as UIImage?
        let sadSelect = UIImage(named: "UIButtonsSadSelected.png") as UIImage?
        let happySelect = UIImage(named: "UIButtonsHappySelected.png") as UIImage?
        
        Buttons.happyButton.frame = CGRect(x: 80, y: 150, width: 50, height: 50)
        Buttons.happyButton.setBackgroundImage(happy, forState: .Normal)
        Buttons.happyButton.setBackgroundImage(happySelect, forState: .Selected)
        Buttons.happyButton.tag = 0
        Buttons.happyButton.addTarget(self, action: "makeHappy:", forControlEvents:.TouchUpInside)
        view.addSubview(Buttons.happyButton)
        
        Buttons.sadButton.frame = CGRect(x: 240, y: 150, width: 50, height: 50)
        Buttons.sadButton.setBackgroundImage(sad, forState: .Normal)
        Buttons.sadButton.setBackgroundImage(sadSelect, forState: .Selected)
        Buttons.sadButton.tag = 1
        Buttons.sadButton.addTarget(self, action: "makeSad:", forControlEvents:.TouchUpInside)
        view.addSubview(Buttons.sadButton)
        println(Device.deviceModel)
        println(Device.deviceSystemName)
        println(Device.deviceSystemVersion)
        
}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 /*
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.apps.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(self.apps)"
    }
*/
    
    @IBAction func sendButton(sender: AnyObject) {
        if(isUserHappy.happy == 1){
            makeHappyPost()
        }
        if(isUserHappy.sad == 1){
            makeSadPost()
        }
        var username: String = LoginViewController().username
        var app: String = LoginViewController().app
        println(username)
        println(app)
    }
    
    func makeSadPost(){
        let url = "https://comp2014group1.herokuapp.com/feedbacks"
        var text: String = userComment.text
        let params = ["string": "&feedback[rating]=0&feedback[comment]=" + text + "&feedback[user_name]=" + username /* + "&feedback[app_name]=" + appName*/]
        
        net.POST(url, params: params, successHandler: {
            responseData in
            let result = responseData.json(error: nil)
            NSLog("result: \(result)")
            }, failureHandler: { error in
                NSLog("Error")
        })
    }
    
    @IBOutlet weak var userComment: UITextField!
    
    func makeHappyPost(){
        let url = "https://comp2014group1.herokuapp.com/feedbacks"
        var text: String = userComment.text
        let params = ["string": "&feedback[rating]=1&feedback[comment]=" + text + "&feedback[user_name]=" + username /*+ "&feedback[app_name]=" + appName*/]
        
        net.POST(url, params: params, successHandler: {
            responseData in
            let result = responseData.json(error: nil)
            NSLog("result: \(result)")
            }, failureHandler: { error in
                NSLog("Error")
        })
    }
    
    func makeHappy(sender:UIButton){
        isUserHappy.happy = 1
        isUserHappy.sad = 0
        sender.selected = !sender.selected
        Buttons.sadButton.selected = false
    }
    
    func makeSad(sender:UIButton){
        isUserHappy.sad = 1
        isUserHappy.happy = 0
        sender.selected = !sender.selected
        Buttons.happyButton.selected = false
    }
    
//    // MARK: - LoginViewControllerDelegate
//    func didSubmitAppText(appText: String, forUsername username: String) {
//        println("ViewController gets appText \(appText) and username \(username)")
//    }
    
}
