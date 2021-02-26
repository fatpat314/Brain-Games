//
//  GlobalState.swift
//  Brain Games
//
//  Created by patrick kelly on 2/24/21.
//

import Foundation

class GlobalState: ObservableObject {
    @Published var word_color = ""
    @Published var displayWord: String = "hello"
//    var number = 0
    
//    func randomNumber() -> Int{
//    let number = Int.random(in: 0..<8)
//        return number
//    }
    
    enum wordColors: Int{
        case blue = 1
        case green = 2
        case yellow = 3
        case orange = 4
        case red = 5
        case purple = 6
    }
    
    func wordChoice(){
        let number = Int.random(in: 0..<8)
        switch number{
        case 1:
            displayWord = "blue"
        case 2:
            displayWord = "green"
        case 3:
            displayWord = "yellow"
        case 4:
            displayWord = "orange"
        case 5:
            displayWord = "red"
        case 6:
            displayWord = "purple"
        default:
            break
        }
    }
    

    func changing_colors() {
        enum choices{
            case red
            case orange
            case yellow
            case green
            case blue
            case purple
        }
    }
}
