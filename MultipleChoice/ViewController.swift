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
    }
    
}

