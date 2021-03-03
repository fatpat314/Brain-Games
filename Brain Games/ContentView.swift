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
    @EnvironmentObject var env: GlobalState
    @State private var isActive : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Does the text of first word match the color in the second word.").multilineTextAlignment(.center)
                NavigationLink(destination: GameView().environmentObject(GlobalState()), isActive: $isActive){
                    Text("")
                        .navigationBarTitle("Color Game")
                }
                Button("Start Game"){
                    self.isActive = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                        self.isActive = false
                    }
                }
                
            }
        }
    }
}

struct GameView: View {
    
    @EnvironmentObject var env: GlobalState
    @State var color1 = Int.random(in: 0..<6)
    @State var color2 = Int.random(in: 0..<6)
    @State private var timeRemaining = 10
    
    @State var isActive: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in:
                                .common).autoconnect()
    
    var body: some View {
        let points = env.points
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
                }else{
                    env.pointsReset()
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalState())
    }
}

