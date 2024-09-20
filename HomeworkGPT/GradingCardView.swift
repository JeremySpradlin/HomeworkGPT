import SwiftUI

struct GradingCardView: View {
    var response: GradingResponse
    
    var body: some View {
        Text(response.summary)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}