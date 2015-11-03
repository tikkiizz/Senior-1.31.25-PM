//
//  About.swift
//  Senior
//
//  Created by CPE KMUTT on 11/2/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import Foundation
import UIKit
import Parse
class About {
    private var about : String
    private var contact : String
    
    init(){
        self.about = ""
        self.contact = ""
        
    }
    
    func setAbout(x: String) -> Void {
        self.about = x
    }
    
    func setContact(x: String) -> Void{
        self.contact = x
    }
    func getAbout() -> String{
        return self.about
    }
    
    func getContact() -> String{
        return self.contact
    }
    
}