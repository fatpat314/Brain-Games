//
//  GlobalState.swift
//  Brain Games
//
//  Created by patrick kelly on 2/24/21.
//

import Foundation
import SwiftUI

class GlobalState: ObservableObject {
    @Published var word_color = ""
    @Published var displayWordTop: String = ""
    @Published var displayWordBottom: String = ""
    @Published var displayColorTop: String = "blue"
    @Published var points: Int = 0
    
    var correctAnswer: String = ""

    
    func correctAnswerIsYes(){
        if displayWordTop == correctAnswer{
            print("winner")
            points += 10
        }else{
            print("loser")
            points -= 10
        }
        print(displayWordTop, correctAnswer)
    }
    
    func correctAnswerIsNo(){
        if displayWordTop != correctAnswer{
            print("Winner")
            points += 10
        }else{
            print("Loser")
            points -= 10
        }
        print(displayWordTop, correctAnswer)
    }
    
    func pointsReset(){
        points = 0
    }
    
    func changeBkColor(color: Int) -> Color{
        print(color)
        switch color{
            case 0:
                correctAnswer = "blue"
                return Color.blue;
            case 1:
                correctAnswer = "green"
                return Color.green;
            case 2:
                correctAnswer = "yellow"
                return Color.yellow;
            case 3:
                correctAnswer = "orange"
                return Color.orange;
            case 4:
                correctAnswer = "red"
                return Color.red
            case 5:
                correctAnswer = "purple"
                return Color.purple
        default:
            break
        }
        return Color.blue
    }
    
    func wordChoice(){
        let numberTop = Int.random(in: 1..<7)
        let numberBottom = Int.random(in: 1..<7)
        switch numberTop{
        case 1:
            displayWordTop = "blue"
        case 2:
            displayWordTop = "green"
        case 3:
            displayWordTop = "yellow"
        case 4:
            displayWordTop = "orange"
        case 5:
            displayWordTop = "red"
        case 6:
            displayWordTop = "purple"
        default:
            break
        }
        switch numberBottom{
        case 1:
            displayWordBottom = "blue"
        case 2:
            displayWordBottom = "green"
        case 3:
            displayWordBottom = "yellow"
        case 4:
            displayWordBottom = "orange"
        case 5:
            displayWordBottom = "red"
        case 6:
            displayWordBottom = "purple"
        default:
            break
        }
    }
}
