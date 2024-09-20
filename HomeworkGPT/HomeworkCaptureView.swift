import SwiftUI

struct HomeworkCaptureView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var gradingResponses: [GradingResponse] = []
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    // Add a property to track the last used source type
    @State private var lastUsedSourceType: UIImagePickerController.SourceType?

    var body: some View {
        VStack(spacing: inputImage == nil ? 40 : 20) { // Adjusted spacing
            // Image view is now at the top
            if let inputImage = inputImage {
                Image(uiImage: inputImage)
                    .resizable()
                    .scaledToFit()
            }

            // Conditional button based on whether an image has been picked
            if inputImage != nil {
                Button("Send") {
                    // Placeholder for send action
                }
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                .contentShape(Rectangle())
            } else {
                // Select Photo button is shown only if no image is picked
                Button(action: {
                    showingImagePicker = true
                    imagePickerSourceType = .photoLibrary
                }) {
                    Text("Select Photo")
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .contentShape(Rectangle())
            }

            // Retake or Reselect Photo button
            Button(action: {
                showingImagePicker = true
                // Use the last used source type or default to photo library
                imagePickerSourceType = lastUsedSourceType ?? .photoLibrary
            }) {
                Text(inputImage != nil ? (lastUsedSourceType == .camera ? "Retake Photo" : "Reselect Photo") : "Take Photo")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
            }
            .background(inputImage != nil ? Color.orange : Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .contentShape(Rectangle())
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: processImage) {
            ImagePicker(image: $inputImage, sourceType: imagePickerSourceType) // Pass source type to ImagePicker
        }
    }
    
    func processImage() {
        // Remember the last used source type
        lastUsedSourceType = imagePickerSourceType
        guard inputImage != nil else { return }
        // Convert UIImage to Data and send to ChatGPT's API
        // This is a placeholder for the actual API call
        let dummyResponse = GradingResponse(summary: "This is a dummy response.")
        gradingResponses.append(dummyResponse)
    }
}
