//
//  Game.swift
//  Code History
//
//  Created by Julian Smith on 11/29/22.
//

import Foundation


struct Game {
    private let questions: [Question] = Question.all.shuffled()
    private(set) var guesses = [Question: Int]()
    private(set) var currentQuestionIndex: Int = 0
    private(set) var isOver: Bool = false;
    
    var guessCount: (correct: Int, incorrect: Int) {
            var count: (correct: Int, incorrect: Int) = (0, 0)
            for (question, guessedIndex) in guesses {
                if question.correctAnswerIndex == guessedIndex {
                    count.correct += 1
                } else {
                    count.incorrect += 1
                }
            }
            return count
        }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    mutating func makeGuessForCurrentQuestion(_ index: Int) {
        guesses[currentQuestion] = index
    }
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < numberOfQuestions - 1 {
            self.currentQuestionIndex += 1
        } else {
            self.isOver = true
        }
    }
}
