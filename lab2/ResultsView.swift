import SwiftUI

struct ResultsView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.28, green: 0.07, blue: 0.55), Color(red: 0.15, green: 0.05, blue: 0.35)],
                startPoint: .top, endPoint: .bottom
            ).ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                Image(systemName: score >= total / 2 ? "star.fill" : "face.smiling")
                    .font(.system(size: 72))
                    .foregroundColor(.yellow)

                VStack(spacing: 8) {
                    Text("Quiz klart!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Du fick \(score) av \(total) rätt")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.85))
                }

                Spacer()

                Button {
                    onRestart()
                } label: {
                    Text("Försök igen")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.28, green: 0.07, blue: 0.55))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 32)
                }

                Spacer().frame(height: 20)
            }
        }
    }
}
