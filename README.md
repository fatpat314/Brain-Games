# Brain-Games
# MatchGame

Sample iOS color matching game. This game mocks up one of those "brain training" games based on the [Stroop Effect](https://faculty.washington.edu/chudler/words.html). 

The game is built using SwiftUI and shows how you might construct a single view application with SwiftUI. 

## The Game 

The game shows two colored text labels and asks if the color name of the top label matches the color of the bottom label. The bottom is displayed in a color that doesn't necessarily match the text. 

The challenge is disaccosiating your perception of the color name and the actual color. 

Read more about the  [Stroop Effect](https://faculty.washington.edu/chudler/words.html). 

## SwiftUI 

[SwiftUI](https://developer.apple.com/documentation/swiftui/) is Apple's newset addition to the Swift ecosystem. SwiftUI is a language for creating user interfaces. I think it's a huge improvement over storyboard. 

At this time it only works with 

- iOS13+ 
- macOS15+
- Mac Catalyst 13+
- tvOS 13+
- watchOS 6+

It promises better performance than storyboards and seems to be a lot easier to use. 


## Game Play

I'm using the the term "game" here to represent one session of play. This would include displaying the colors and color word labels, starting the timer, waiting for a a Yes or No input. Tapping Yes or No ends the game and displays the results. 

In this implementation the results are displayed for 1 second before a new game is started. 

A correct answer is: Yes when the color name at the top matches the actual color of the text below or No when they don't match. For each correct answer the score increases by 100 and for each incorrect answer the score decreases by 100. 

A streak represents how many correct answers were provided in a row. When an incorrect answer occurs the streak is reset to 0. 

Currently colors are chosen from a list of 6: 

1. Red
2. Orange
3. Yellow
4. Green 
5. Blue
6. Purple

Internally GameController holds three colors: colorA (color and the text in the upper label), colorB (text of the lower label), and colorC (color of thelower label). When a game begins colors are assigned assigned randomly to each from the list. Yes is the correct answer when colorA and colorC match.

The odds of a Yes being correct is about 1 in 6. This makes No the most common answer. The game might be more interesting if the odds of a correct answer were 1 in 2. This might be an interesting experiment. 


