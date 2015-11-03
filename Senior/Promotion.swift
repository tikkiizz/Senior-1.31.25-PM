//
//  Promotion.swift
//  Senior
//
//  Created by CPE KMUTT on 11/2/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//
import UIKit
import Foundation
class Promotion {
    private var promoName : String
    private var promoPic : UIImage?
    private var promoDetail : String
    
    init(){
        self.promoName = ""
        //self.promoPic.images
        self.promoDetail = ""
    }
    
    func setPromoName(x: String) -> Void {
        self.promoName = x
    }
    
    func setPromoPic(x: UIImage) -> Void{
        self.promoPic = x
    }
    func setPromoDetail(x: String) -> Void{
        self.promoDetail = x
    }
    func getPromoName() -> String{
        return self.promoName
    }
    
    func getPromoPic() -> UIImage{
        return self.promoPic!
    }
    func getPromoDetail() -> String{
        return self.promoDetail
    }
}