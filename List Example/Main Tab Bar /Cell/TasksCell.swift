//
//  TasksCell.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class TasksCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
}
