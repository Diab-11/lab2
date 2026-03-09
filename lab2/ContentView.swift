import SwiftUI

let questions: [Question] = [
    Question(text: "Vad är huvudstaden i Sverige?",
             options: ["Göteborg", "Stockholm", "Malmö", "Uppsala"],
             correctAnswer: "Stockholm"),
    Question(text: "Vilket år grundades Apple?",
             options: ["1972", "1984", "1976", "1980"],
             correctAnswer: "1976"),
    Question(text: "Hur många planeter finns i solsystemet?",
             options: ["7", "8", "9", "10"],
             correctAnswer: "8"),
    Question(text: "Vilket språk används för iOS-utveckling?",
             options: ["Kotlin", "Java", "Swift", "Python"],
             correctAnswer: "Swift"),
    Question(text: "Vad är huvudstaden i Frankrike?",
             options: ["Berlin", "Madrid", "Paris", "Rom"],
             correctAnswer: "Paris"),
]

struct ContentView: View {
    @State private var currentIndex = 0
    @State private var score = 0
    @State private var quizFinished = false

    var body: some View {
        if quizFinished {
            ResultsView(score: score, total: questions.count) {
                currentIndex = 0
                score = 0
                quizFinished = false
            }
        } else {
            QuestionView(
                question: questions[currentIndex],
                questionNumber: currentIndex + 1,
                total: questions.count
            ) { answer in
                if answer == questions[currentIndex].correctAnswer {
                    score += 1
                }
                if currentIndex + 1 < questions.count {
                    currentIndex += 1
                } else {
                    quizFinished = true
                }
            }
        }
    }
}
