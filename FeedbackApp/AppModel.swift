//
//  AppModel.swift
//  FeedbackApp
//
//  Created by Vardan Tandon on 20/03/2015.
//  Copyright (c) 2015 Delia Gander. All rights reserved.
//

import Foundation

class AppModel: NSObject, Printable {
    let name: String
    
    
    override var description: String {
        return "\(name) \n"
    }
    
    init(name: String?) {
        self.name = name ?? ""
    }
}