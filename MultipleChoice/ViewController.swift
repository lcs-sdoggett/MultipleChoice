//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Doggett, Scott on 2019-12-04.
//  Copyright © 2019 Doggett, Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var questionsAmount: UITextField!
    @IBOutlet weak var studentAnswers: UITextField!
    @IBOutlet weak var correctAnswers: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    
    // MARK: Methods
    
    // Runs when program opens
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionsAmount.becomeFirstResponder() // First text input is first responded
    }
    
    // MARK: ACTIONS
    
    @IBAction func checkAnswers(_ sender: Any) {
        
        // Variable represents the amount of answers that are correct
        var numberOfCorrectAnswers = 0
        
        // Change amount of questions input into a string
        guard let questionsAmountAsString = questionsAmount.text, questionsAmountAsString.count != 0, let questionsAmount = Int(questionsAmountAsString) else{
            outputTextView.text = "Please enter an integer greater than 0."
            return
        }
        
        // Change sutdents answers into a string
        guard let studentAnswersAsString = studentAnswers.text, studentAnswersAsString.count != 0, studentAnswersAsString.count == questionsAmount else{
            // Change output if the string can't be converted, or is not the right length
            outputTextView.text = "Please make sure you input exactly \(questionsAmount) student answers."
            return
        }
        
        // Check if students answers are anything other then a,b,c,d or e
        for character in studentAnswersAsString.lowercased() {
            switch character {
            case  "a", "b", "c", "d", "e":
                continue
            default:
                // Change output if the string contains things other then a,b,c,d or e
                outputTextView.text = "Student answers contains invalid choices. Please ensure that only characters A, B, C, D or E are used."
                return
            }
        }

        // Change correct answers into a string
        guard let correctAnswersAsString = correctAnswers.text, correctAnswersAsString.count != 0, correctAnswersAsString.count == questionsAmount else{
            // Change output if the string can't be converted, or is not the right length
            outputTextView.text = "Please make sure you enter exactly \(questionsAmount) answers for the answer key."
            return
        }
        
        // Check if correct answers are anything other then a,b,c,d or e
        for character in correctAnswersAsString.lowercased() {
            switch character {
            case  "a", "b", "c", "d", "e":
                continue
            default:
                // Change output if the string contains things other then a,b,c,d or e
                outputTextView.text = "Correct answers contains invalid choices. Please ensure that only characters A, B, C, D or E are used."
                return
            }
        }

        
        // Cycle through each character in correctAnswers
        for (position, singleCharacter) in correctAnswersAsString.enumerated() {
            
            // Get character from studentAnswers that has an index that corresponds to correctAnswers
            let index = studentAnswersAsString.index(studentAnswersAsString.startIndex, offsetBy: position)
            
            // If they are the same, add 1 to right answers
            if singleCharacter == studentAnswersAsString[index] {
                numberOfCorrectAnswers += 1
            }
        }
        
        // Change output to display how many answers were right
        outputTextView.text = "The student answered \(numberOfCorrectAnswers ) questions(s) correctly."
    }
    
}


