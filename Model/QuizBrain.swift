//
//  File.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

//this struct will be the heart of the question bank
//it contains two fields, and no functions
//only serving to be the "question/answer" part of the code
struct Question {
    
    //two fields for qustions and answers
    //both declared as Strings, since nothing else will be in there
    var text: String
    var answer: String
    
    //our init function will initialize the two fields with whatever
    init(q: String, a: String) {
        text = q;
        answer = a;
    }
    
}


import Foundation

//begin struct
struct QuizBrain{
    
//array of Question structs
//instead of an array of Strings (like in the Town example) we will have an array of Question structs
//FORM: let quiz = [Question(q: "question", a: "answer"), Question(q: "questions", a: "answer")]
    
    let quiz = [ //begin of array
    
        Question(q: "In New York, there are 2.692 million adults who have a mental health condition.", a: "True"),
        Question(q: "In the U.S., there are 20 million adults who have a mental health condition.", a: "False"),
        Question(q: "50% of mental illness begins by age 14.", a: "True"),
        Question(q: "75% of mental illness begins by age 24.", a: "True"),
        Question(q: "1 American dies by suicide every 12 minutes.", a: "True"),
        Question(q: "30% of U.S. adults with mental illness also have a substance use disorder.", a: "False"),
        Question(q: "70% of people experiencing homelessness also have a serious mental illness.", a: "False"),
        Question(q: "37% of people incarcerated in state and federal prison have a diagnosed mental condition.", a: "True"),
        Question(q: "60% of youth in the juvenile justice system have at least one mental health condition.", a: "False"),
        Question(q: "Depression and anxiety disorders cost the global economy $1,000,000,000,000 each year in lost productivity.", a: "True"),
        Question(q: "1 in 15 Americans has a mental health condition.", a: "False"),
        Question(q: "8 million adults live with a severe mental illness.", a: "False"),
        Question(q: "1 out of every 8 emergency department visits involves a mental health or substance use condition.", a: "True"),
        Question(q: "Depression is the #1 leading cause of disability in the world.", a: "True"),
        Question(q: "16% of people who die by suicide have a diagnosed mental health condition.", a: "False"),
        Question(q: "90% of people who die by suicide have experienced symtpoms of a mental health condition.", a: "True"),
        Question(q: "1 million people in New York live in a mental health professional shortage area.", a: "False"),
        Question(q: "50 million people in the U.S. live in a mental health professional shortage area.", a: "False"),
        Question(q: "The average delay between mental health symptom onset and treatment is 11 years.", a: "True"),
        Question(q: "About 4 in 10 people with a mental health condition received any treatment in a year.", a: "True"),
        Question(q: "FINAL QUESTION PLACEHOLDER", a: "True"),
        ]
   
    
//variable for our array index - Int
    var arrayIndex : Int = 0
//variable for number of right answers - Int
    var scoreRight : Int = 0
//variable for number of wrong answers - Int
    var scoreWrong : Int = 0
//variable to act as a flag if the user reaches the end of the quiz - Int or Boolean or String
    var endOfQuiz : String = "F"

//FUNCTION - checking the users answer. This will check if the String sent from the ViewController (ie, the user's answer) matches the String from the array of Question structs (ie, the answer)
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return true if user's answer matches, false if not
    func checkAnswer(answer : String) -> Bool{
        
        if (answer == quiz[arrayIndex].answer){
            return true
        }
        else{
            return false
        }
   }

//FUNCTION - retrieving the questions text from the array of Question structs
    //FORM: func functions_name() -> returns question (ie String)
    func showQuestion() -> String{
        
        return quiz[arrayIndex].text
        
    }
       
    
//FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)

//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)
    mutating func rightAnswers() {
        
       scoreRight = scoreRight + 1
        
    }

//FUNCTION - updates the variable that is acting as our array index (we need a "pointer" that will keep track of where in the array we are). Useful for knowing what question we're on and when the quiz is over.
    //FORM: func function_name()
    mutating func moveForward() {
        
        if(arrayIndex < 20) {
            arrayIndex = arrayIndex + 1
        }
    }

}
