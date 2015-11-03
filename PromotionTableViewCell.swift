//
//  PromotionTableViewCell.swift
//  Senior
//
//  Created by CPE KMUTT on 11/2/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPromoPic: UIImageView!
    @IBOutlet weak var lbPromoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
