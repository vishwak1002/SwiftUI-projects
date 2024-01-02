//
//  ContentView.swift
//  WordScramble
//
//  Created by vishwasai.karnati on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords=[String]()
    @State private var rootWord=""
    @State private var newWord=""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var mistakes=0
    var score:Int{
        
            var value=0
            
            usedWords.forEach{ word in
                value += word.count
            }
            value+=usedWords.count
            return value - mistakes
        
    }
    var body: some View {
        
        
        NavigationView{
        
                List{
                    
                    Section{
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    .onSubmit(addNewWord)
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                    Section{
                        Text("\(score)")
                    }header: {
                        Text("Score is ")
                    }
                
                
                
            }.navigationTitle(rootWord)
                .toolbar {
                                    Button("Reset", action: startGame)
                                }
           
        }
        .onAppear(perform: startGame)
       
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        
    }
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count>=3 else{
            wordError(title: "Word is shorter than 3 letters", message: "Try Again")
            mistakes+=1
            return
            
        }
        guard answer != rootWord else{
            wordError(title: "Word is same as root word", message: "You cant just use the root word")
            mistakes+=1
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            mistakes+=1
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            mistakes+=1
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            mistakes+=1
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        
        
    }
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                newWord=""
                usedWords=[String]()
                mistakes=0
                return
            }
            
        }
        // If were are *here* then there was a problem – trigger a crash and report the error
           fatalError("Could not load start.txt from bundle.")
        
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
