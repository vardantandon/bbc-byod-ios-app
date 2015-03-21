//
//  DownStateButton.swift
//  FeedbackApp
//
//  Created by Delia Gander on 25/02/2015.
//  Copyright (c) 2015 Delia Gander. All rights reserved.
//

import UIKit

class DownStateButton : UIButton {
    
    var myAlternateButton:Array<DownStateButton>?
    
    var downStateImage:String?{
        
        didSet{
            
            if downStateImage != nil {
                
                self.setImage(UIImage(named: downStateImage!), forState: UIControlState.Selected)
            }
        }
    }
    
    func unselectAlternateButtons(){
        
        if myAlternateButton != nil {
            
            self.selected = true
            
            for aButton:DownStateButton in myAlternateButton! {
                
                aButton.selected = false
            }
            
        }else{
            
            toggleButton()
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        unselectAlternateButtons()
        super.touchesBegan(touches, withEvent: event)
    }
    
    func toggleButton(){
        
        if self.selected==false{
            
            self.selected = true
        }else {
            
            self.selected = false
        }
    }
}
