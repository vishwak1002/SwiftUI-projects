//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by vishwasai.karnati on 07/07/23.
//

import SwiftUI


struct CustomImageView:View{
    var image:String
    var body:some View{
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
//    @State private var animationAmount = 0.0
//    @State private var tapped=[false,false,false]
    @State private var tappedFlag = -1
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var numOfQuestions=0
    @State private var resetGame=false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    func button(number:Int)->some View
    {
        Button {
            flagTapped(number)
//            withAnimation {
////                                animationAmount += 360
//                            }
            // flag was tapped
        } label: {
            CustomImageView(image: countries[number])
            
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 5)
        }
       
          
        .alert(scoreTitle, isPresented:$showingScore){
            Button("Continue",action: askQuestion)
            
        }message: {
            Text("Your score is \(userScore)")
        }
        
    }
    
    
    var body: some View {
        
        ZStack{
                        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.2, green: 0.1, blue: 0.3), location: 0.3),
//                .init(color: Color(red: 0.6, green: 0.3, blue: 0.2), location: 0.3),
//            ], center: .top, startRadius: 200, endRadius: 400)
//            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                VStack(spacing:15){
                    VStack{
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                          
                            // flag was tapped
                        } label: {
                            CustomImageView(image: countries[number])
                                .rotation3DEffect(.degrees(tappedFlag==number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(tappedFlag==number || tappedFlag == -1 ? 1 :0.75)
                                .scaleEffect(tappedFlag == -1 || tappedFlag == number ? 1 : 0.5)
                                .animation(.default, value: tappedFlag)
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 5)
                        }
                        

                        .alert(scoreTitle, isPresented:$showingScore){
                            Button("Continue",action: askQuestion)
                            
                        }message: {
                            Text("Your score is \(userScore)")
                        }
//                        if (tappedFlag == -1){
//                            button(number: number)
//                        }
//                        else if (tappedFlag==number){
//                            button(number: number)
//                                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//                        }
//                        else{
//                            button(number: number).opacity(0)
//                        }
                        
                  
                      
                    }
                    .alert("The game is completed .Your score is \(userScore)/8", isPresented: $resetGame){
                        Button("Do you want to restart ?",action:reset)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
            
        }
        
//
        
    }
    func flagTapped(_ number :Int){
        numOfQuestions+=1
        tappedFlag=number
        if number == correctAnswer{
            scoreTitle="Correct"
            userScore+=1
        }
        else{
            scoreTitle="Wrong that is the flag of \(countries[number])"
        }
        showingScore=true
        if numOfQuestions == 8{
            resetGame=true
        }
    }
     func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
         tappedFlag = -1
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
