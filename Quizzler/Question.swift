//
//  Question.swift
//  Quizzler
//
//  Created by Eva on 15-06-18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    //init methode bepaald welke parameters mee moeten worden gegeven bij nieuwe Question objecten
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}

