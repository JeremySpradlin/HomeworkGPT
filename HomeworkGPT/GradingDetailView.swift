import SwiftUI

struct GradingDetailView: View {
    var response: GradingResponse
    
    var body: some View {
        Text(response.summary)
            // Add more details as needed
    }
}