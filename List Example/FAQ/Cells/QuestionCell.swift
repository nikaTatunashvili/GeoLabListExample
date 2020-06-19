//
//  QuestionCell.swift
//  List Example
//
//  Created by GL on 6/19/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    
}

extension QuestionCell: AppCellRepresentable {
    func setup(text: String) {
        self.selectionStyle = .none
        titleLable.text = text
    }
}
