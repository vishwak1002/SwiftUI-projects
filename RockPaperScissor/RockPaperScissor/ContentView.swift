//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by vishwasai.karnati on 30/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var userScore = 0
    @State private var numOfQuestions=0
    @State private var resetGame=false
    @State private var scoreTitle = ""
    @State private var arr = ["🥌","🧻","✂️"]
    private  let win = ["🥌":"🧻","🧻":"✂️","✂️":"🥌"]
    @State var appChoice = Int.random(in: 0..<3)
    @State private var winOrLose = Bool.random()
    var winOrLoseText:String{
        return winOrLose ? "Win" : "Lose"
    }
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                VStack(spacing:10){
                    
                Text("The app Choice is : \(arr[appChoice])")
                Text("The player needs to \(winOrLoseText)")
                    
                     }.multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(20)
                VStack(spacing:20){
                    ForEach(0..<3){ number in
                        
                        Button{
                            buttontapped(number: number)
                        }label: {
                            Text("\(arr[number])")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                            .font(.system(size: 18))
                                            .padding()
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.white, lineWidth: 2))
                        }.cornerRadius(25)
                        .alert(scoreTitle, isPresented: $showingScore){
                            Button("Continue",action: askQuestion)
                        }message: {
                            Text("Your score is \(userScore)")
                        }
                        
                    }
                    .alert("The game is completed .Your score is \(userScore)/10", isPresented: $resetGame){
                        Button("Do you want to restart ?",action:reset)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                
            }
        }
       
    }
    func buttontapped(number:Int){
        numOfQuestions+=1
        if winOrLose{
            if arr[number] == win[arr[appChoice]]{
                scoreTitle="Correct"
                userScore+=1
            }
            else{
                scoreTitle="Wrong that is the correct answer is  of \( win[arr[appChoice]]!))"
            }
           
        }
        else{
            if arr[number] != win[arr[appChoice]]{
                scoreTitle="Correct"
                userScore+=1
            }
            else{
                scoreTitle="Wrong that is the correct answer is  not to select  \(String(describing: win[arr[appChoice]]))"
            }
        }
        showingScore=true
        if numOfQuestions == 10{
            resetGame=true
        }
    }
    func askQuestion(){
        appChoice = Int.random(in: 0..<3)
        winOrLose.toggle()
    }
    func reset(){
        userScore=0
        numOfQuestions=0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
