import SwiftUI

struct QuestionView: View {
    let question: Question
    let questionNumber: Int
    let total: Int
    let onAnswer: (String) -> Void

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            VStack(spacing: 24) {
                // Progress
                Text("Fråga \(questionNumber) av \(total)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                ProgressView(value: Double(questionNumber - 1), total: Double(total))
                    .tint(Color(red: 0.28, green: 0.07, blue: 0.55))
                    .padding(.horizontal)

                Spacer()

                // Question card
                VStack(spacing: 16) {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(Color(red: 0.28, green: 0.07, blue: 0.55))

                    Text(question.text)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Spacer()

                // Answer buttons
                VStack(spacing: 12) {
                    ForEach(question.options, id: \.self) { option in
                        Button {
                            onAnswer(option)
                        } label: {
                            Text(option)
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.28, green: 0.07, blue: 0.55))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 40)
        }
    }
}
