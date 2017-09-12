//
//  MyTableViewCell.swift
//  ToDoListCoreData
//
//  Created by Satyam Saluja on 29/06/17.
//  Copyright © 2017 Satyam Saluja. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var mylable: UILabel!
    @IBOutlet weak var myimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
