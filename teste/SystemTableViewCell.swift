//
//  SystemTableViewCell.swift
//  teste
//
//  Created by Alexandra Viana Zarzar on 12/03/20.
//  Copyright © 2020 Alexandra Viana Zarzar. All rights reserved.
//

import UIKit

class SystemTableViewCell: UITableViewCell {

    @IBOutlet var cellSwitch: UISwitch!
    var callback: ((Bool)->())?
    
    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        callback?(sender.isOn)
    }
    
}
