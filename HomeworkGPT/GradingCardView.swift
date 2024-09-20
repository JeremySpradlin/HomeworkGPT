import SwiftUI

struct GradingCardView: View {
    var response: GradingResponse
    
    var body: some View {
        Text(response.summary)
            .padding()
            .frame(maxWidth: .infinity) // Stretch to the sides of the screen
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}