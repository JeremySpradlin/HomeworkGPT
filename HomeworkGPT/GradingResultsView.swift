import SwiftUI

struct GradingResultsView: View {
    @State private var gradingResponses: [GradingResponse] = [
        // Dummy data for testing
        GradingResponse(summary: "This is a dummy response.")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(gradingResponses) { response in
                        NavigationLink(destination: GradingDetailView(response: response)) {
                            GradingCardView(response: response)
                        }
                    }
                }
            }
            .navigationTitle("Grading Results")
        }
    }
}