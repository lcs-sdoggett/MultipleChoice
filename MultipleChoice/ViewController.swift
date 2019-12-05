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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: ACTIONS
    
    @IBAction func checkAnswers(_ sender: Any) {
        
        var numberOfCorrectAnswers = 0
        
        // Change amount of questions input into a string
        guard let questionsAmountAsString = questionsAmount.text, questionsAmountAsString.count != 0, let questionsAmount = Int(questionsAmountAsString) else{
            outputTextView.text = "Please enter an integer greater than 0."
            return
        }
        
        guard let studentAnswersAsString = studentAnswers.text, studentAnswersAsString.count != 0, studentAnswersAsString.count == questionsAmount else{
            outputTextView.text = "Please make sure you input exactly \(questionsAmount) student answers."
            return
        }
        
        guard let correctAnswersAsString = correctAnswers.text, correctAnswersAsString.count != 0, correctAnswersAsString.count == questionsAmount else{
            outputTextView.text = "Please make sure you enter exactly \(questionsAmount) answers for the answer key."
            return
        }
        
        
        for (position, singleCharacter) in correctAnswersAsString.enumerated() {
            
            let index = studentAnswersAsString.index(studentAnswersAsString.startIndex, offsetBy: position)
            
            if singleCharacter == studentAnswersAsString[index] {
                numberOfCorrectAnswers += 1
            }
        }
        
        outputTextView.text = "The student answered \(numberOfCorrectAnswers ) questions(s) correctly."
    }
    
}


