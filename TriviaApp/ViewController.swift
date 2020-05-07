//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit

//information for questions from Nami's website
class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    //number of total seconds
    var totalTime: Float = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // THIS FUNCTION ALWAYS RUNS WHEN THE APP LOADS
        //VERY SIMILIAR TO SETUP() IN PROCESSING
        //THIS IS WHERE WE WILL CALL/ACTIVATE OUR CUSTOM FUNCTION, UPDATEUI()
        //UPDATEUI WILL SETUP EVERYTHING FOR THE REST OF THE CODE TO WORK
        currentQuestion.text = quizBrain.showQuestion()
      
        rightAnswer.alpha = 0
        wrongAnswer.alpha = 0
        
        endMessage.alpha = 0
    }
    
    //UPDATEUI WILL UPDATE ANY ON SCREEN ELEMENTS AS WELL AS SETUP EVERYTHING FOR OUR FIRST PLAY THROUGH
    @objc func updateUI(){
        
        
        
        //CLEAR ANY COLOR CHANGES (FOR INSTANCE, IF THE COLOR CHANGES WHEN USER GETS QUESTION RIGHT/WRONG, WE WANT THE COLOR TO CHANGE BACK AFTER THEY ANSWER THE QUESTION
        rightAnswer.alpha = 0
        wrongAnswer.alpha = 0
        
        //UPDATE THE PROGRESS BAR
        
        //UPDATE THE QUESTION THAT APPEARS ON SCREEN
        quizBrain.moveForward()
        currentQuestion.text = quizBrain.showQuestion()
        
        
        //CONDITIONAL THAT WILL CHECK IF THE QUIZ IS OVER. SOME KIND ON SCREEN FEEDBACK SHOULD HAPPEN AT THIS POINT. DISPLAY SCORE, CONGRATULATE THE PLAYER, ETC
        if(quizBrain.arrayIndex == 19) {
            print("DONE")
            
            endMessage.alpha = 1.0
            currentQuestion.alpha = 0
            rightAnswer.alpha = 0
            wrongAnswer.alpha = 0
        }
        
        
    }
    
    @IBOutlet weak var rightAnswer: UILabel!
    
    @IBOutlet weak var wrongAnswer: UILabel!
    
    @IBOutlet weak var endMessage: UILabel!
   
    @IBOutlet weak var currentQuestion: UILabel!
    
    //IBACTION FUNCTION (TRUE AND FALSE BUTTONS SHOULD BE LINKED TO THIS FUNCTION)
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
    
            //STORE THE CURRENTTITLE OF THE BUTTON IN A VARIABLE
        var currentTitle = sender.currentTitle!
    
            //CHECK THE ANSWER USING QUIZBRAIN
        if(quizBrain.checkAnswer(answer: currentTitle) == true) {
            //change color
            sender.tintColor = UIColor.green
            print("R")
            rightAnswer.alpha = 1.0
        }
        else{
            //change color
            sender.tintColor = UIColor.red
            print("W")
            wrongAnswer.alpha = 1.0
        }
        
            //CONDITIONAL STATEMENT THAT WILL:
                //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
                //UPDATE THE SCORE VARIABLES
                //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
            
            //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
        
        
        //timer = timer + 1
        
       // timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        //GO TO THE NEXT QUESTION
            updateUI()
        
    }
    

}

