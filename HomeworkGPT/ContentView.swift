import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeworkCaptureView()
                .tabItem {
                    Label("Capture", systemImage: "camera")
                }
            
            GradingResultsView()
                .tabItem {
                    Label("Results", systemImage: "list.bullet")
                }
        }
    }
}