//
//  ContentView.swift
//  Brain Games
//
//  Created by patrick kelly on 2/24/21.
//

import SwiftUI

struct HomeView: View{
    var body: some View {
        NavigationView{
            Text("Start Game")
        }
    }
}

struct ContentView: View {
//    @EnvironmentObject var env: GlobalState
    var body: some View {
        NavigationView{
            VStack{
                Text("Does the text of first word match the color in the second word.").multilineTextAlignment(.center)
                NavigationLink(destination: GameView().environmentObject(GlobalState())){
                    Text("Start Game")
                        .navigationBarTitle("Color Game")
                }
            }
        }
    }
}
//func changeBkColor(color: Int) -> Color
//{
//    if(color == 1)
//    {
//        return Color.red;
//    }
//    else if(color == 2)
//    {
//        return Color.green;
//    }
//    else if(color == 3)
//    {
//        return Color.blue;
//    }else{
//        return Color.yellow
//    }
//}

struct GameView: View {
    @EnvironmentObject var env: GlobalState
    @State var color1 = Int.random(in: 0..<6)
    @State var color2 = Int.random(in: 0..<6)
    
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in:
                                .common).autoconnect()
    
    var body: some View {
        var points = env.points
        Text("Time: \(timeRemaining)")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .fill(env.changeBkColor(color: self.color1))
                    .opacity(0.75)
            )
        Text("Points: \(points)")
            .navigationBarTitle("Level 1", displayMode: .inline)
            VStack(spacing: 6){
                HStack{
                    Text(env.displayWordTop)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 100, alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(env.changeBkColor(color: self.color1))
                        .padding(8)
                        .onAppear{
                            env.wordChoice()
                        }
                }.background(Color.gray)
                HStack{
                    Text(env.displayWordBottom)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 100, alignment: .center)
                        .foregroundColor(env.changeBkColor(color: self.color2))
                        .padding(8)
                        .onAppear{
                            env.wordChoice()
                        }
                }.background(Color.gray)
                HStack{
                    Button(action: {
//                       Still got to figure out the scoring logic, but its something like this:
//                        if the display word == correct answer, add ten points
                        env.correctAnswerIsYes()
                        env.wordChoice()
                        color1 = Int.random(in: 0..<6)
                        color2 = Int.random(in: 0..<6)
                    }, label: {
                        Text("YES")
                    }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    Button(action: {
                        env.correctAnswerIsNo()
                        env.wordChoice()
                        color1 = Int.random(in: 0..<6)
                        color2 = Int.random(in: 0..<6)
                    }, label: {
                        Text("NO")
                    }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
            }
            .onReceive(timer) { time in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }else if self.timeRemaining == 0{
                    ContentView().environmentObject(GlobalState())
                    points = 0
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalState())
//        GameView().environmentObject(GlobalState())
    }
}







//ZStack{
//
//    Color.black
//        .ignoresSafeArea()
//    VStack(spacing: 6){
//        HStack{
//            Text("Hello")
//                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
//                .foregroundColor(.green)
//                .padding(8)
//        }.background(Color.gray)
//        HStack{
//            Text("Hello")
//                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
//                .foregroundColor(.red)
//                .padding(8)
//        }.background(Color.gray)
//    }
//}
