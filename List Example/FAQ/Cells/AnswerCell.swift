//
//  AnswerCell.swift
//  List Example
//
//  Created by GL on 6/19/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

extension AnswerCell: AppCellRepresentable {
    func setup(text: String) {
        self.selectionStyle = .none
        titleLabel.text = text
    }
}
