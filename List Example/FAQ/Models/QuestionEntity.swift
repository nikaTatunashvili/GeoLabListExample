//
//  QuestionEntity.swift
//  List Example
//
//  Created by GL on 6/19/20.
//  Copyright © 2020 GL. All rights reserved.
//

import Foundation

protocol CellModelable {
    var identifier: String { get }
    var title: String { get }
}

class QuestionEntity: CellModelable {
    init(question: String, answer: AnswerEntity) {
        self.question = question
        self.answer = answer
    }
    
    let question: String
    let answer: AnswerEntity
    
    var isSelected: Bool = false
    
    var questionCellIdentifier: String {
        "QuestionCell"
    }
    
    var identifier: String {
        questionCellIdentifier
    }

    var title: String {
        question
    }
}

struct AnswerEntity: CellModelable {
    let answer: String
    
    var answerCellIdentifier: String {
        "AnswerCell"
    }
    
    var identifier: String {
        answerCellIdentifier
    }
    
    var title: String {
        answer
    }
}
