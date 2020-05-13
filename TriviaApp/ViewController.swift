//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit
import AVFoundation

//information for questions from Nami's website
class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    //number of total seconds
    var totalTime: Float = 0
    
    var player: AVAudioPlayer!
    
    var answerSlot : Bool = true
    var end : Bool = false
    
    var number : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // THIS FUNCTION ALWAYS RUNS WHEN THE APP LOADS
        //VERY SIMILIAR TO SETUP() IN PROCESSING
        //THIS IS WHERE WE WILL CALL/ACTIVATE OUR CUSTOM FUNCTION, UPDATEUI()
        //UPDATEUI WILL SETUP EVERYTHING FOR THE REST OF THE CODE TO WORK
        progressBar.progress = 0.0
        
        currentQuestion.text = quizBrain.showQuestion()
      
        rightAnswer.alpha = 0
        wrongAnswer.alpha = 0
        
        endMessage.alpha = 0
        authorLabel.alpha = 0
        
        hideLabelOne.alpha = 0
        hideLabelTwo.alpha = 0
        hideLabelThree.alpha = 0
        
        timer.invalidate()
        totalTime = 10
               
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
    }
    
    //UPDATEUI WILL UPDATE ANY ON SCREEN ELEMENTS AS WELL AS SETUP EVERYTHING FOR OUR FIRST PLAY THROUGH
    @objc func updateUI(){
        
        answerSlot = true
        
        //CLEAR ANY COLOR CHANGES (FOR INSTANCE, IF THE COLOR CHANGES WHEN USER GETS QUESTION RIGHT/WRONG, WE WANT THE COLOR TO CHANGE BACK AFTER THEY ANSWER THE QUESTION
        rightAnswer.alpha = 0
        wrongAnswer.alpha = 0
        
        //UPDATE THE PROGRESS BAR
        
        //UPDATE THE QUESTION THAT APPEARS ON SCREEN
        quizBrain.moveForward()
        currentQuestion.text = quizBrain.showQuestion()
        
        print(quizBrain.scoreRight)
        
        
        //CONDITIONAL THAT WILL CHECK IF THE QUIZ IS OVER. SOME KIND ON SCREEN FEEDBACK SHOULD HAPPEN AT THIS POINT. DISPLAY SCORE, CONGRATULATE THE PLAYER, ETC
        if(quizBrain.arrayIndex == 20) {
            print("DONE")
            
            end = true
            
            timer.invalidate()
            self.timeLabel.text = "Score : \(quizBrain.scoreRight)"
            
            endMessage.alpha = 1.0
            currentQuestion.alpha = 0
            rightAnswer.alpha = 0
            wrongAnswer.alpha = 0
            authorLabel.alpha = 1.0
            hideLabelOne.alpha = 1.0
            hideLabelTwo.alpha = 1.0
            hideLabelThree.alpha = 1.0
            
            
        }
        timer.invalidate()
        totalTime = 10
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
        number = number + 0.05
        progressBar.progress = number
        
    }
    
    @IBOutlet weak var rightAnswer: UILabel!
    
    @IBOutlet weak var wrongAnswer: UILabel!
    
    @IBOutlet weak var endMessage: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var hideLabelOne: UILabel!
    
    @IBOutlet weak var hideLabelTwo: UILabel!
    
    @IBOutlet weak var hideLabelThree: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    

    @IBOutlet weak var currentQuestion: UILabel!
    
    //IBACTION FUNCTION (TRUE AND FALSE BUTTONS SHOULD BE LINKED TO THIS FUNCTION)
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        if(answerSlot == true) {
            //STORE THE CURRENTTITLE OF THE BUTTON IN A VARIABLE
        var currentTitle = sender.currentTitle!
    
            //CHECK THE ANSWER USING QUIZBRAIN
        if(quizBrain.checkAnswer(answer: currentTitle) == true) {
            print("R")
            rightAnswer.alpha = 1.0
            quizBrain.rightAnswers()
        }
        else{
            print("W")
            wrongAnswer.alpha = 1.0
        }
            
        timer.invalidate()
        
            //CONDITIONAL STATEMENT THAT WILL:
                //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
                //UPDATE THE SCORE VARIABLES
                //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
            
            //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
        
        //timer = timer + 1
        //totalTime = totalTime + 1
        
       // timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerAction() {
   
      if(end == false) {
   
        if (totalTime > 0){
        
            self.timeLabel.text = String(totalTime)
        
            totalTime = totalTime - 1
   
        }
    
    //if timer reaches zero, then display a message on screen, play the alarm sound, and reset the timer
        else{
            playSound(label: "alarm_sound")
        //reset (ie invalidate) the timer to default starting values
            timer.invalidate()
            self.timeLabel.text = "TIME'S UP!"
            answerSlot = false
            }
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        //GO TO THE NEXT QUESTION
            updateUI()
        
    }
    
    func playSound(label : String) {
        let url = Bundle.main.url(forResource: label, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

