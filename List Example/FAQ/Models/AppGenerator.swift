//
//  AppGenerator.swift
//  List Example
//
//  Created by GL on 6/19/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

struct AppGenerator {
    static func makeQuestions() -> [QuestionEntity] {
        (0...30).map { QuestionEntity(question: rendomText(max: 20), answer: AnswerEntity(answer: rendomText(max: ($0 + 20) * 4))) }
    }
    
    static func rendomText(max: Int) -> String {
        
        let source = UUID().uuidString
        print("\n", source, "\n", UIDevice.current.identifierForVendor?.uuidString)
        return (0...max).compactMap({ _ in
            source.randomElement()
        }).map(String.init)
            .joined()
    }
}
