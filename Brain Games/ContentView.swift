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
                Text("Does the text of first word matches the color in the second word.").multilineTextAlignment(.center)
                NavigationLink(destination: GameView().environmentObject(GlobalState())){
                    Text("Start Game")
                        .navigationBarTitle("Color Game")
                }
            }
        }
    }
}

struct GameView: View {
    @EnvironmentObject var env: GlobalState
    var body: some View {
        Text("Your games goes here")
            .navigationBarTitle("Level 1", displayMode: .inline)
            VStack(spacing: 6){
                HStack{
                    Text(env.displayWord)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 100, alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.green)
                        .padding(8)
                }.background(Color.gray)
                HStack{
                    Text(env.displayWord)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 70, maxHeight: 100, alignment: .center)
                        .foregroundColor(.red)
                        .padding(8)
                }.background(Color.gray)
                HStack{
                    Button(action: {
                        env.wordChoice()
                    }, label: {
                        Text("YES")
                    }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    Button(action: {
                        env.wordChoice()
                    }, label: {
                        Text("NO")
                    }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
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
