import SwiftUI

struct HomeworkCaptureView: View {
    @State private var showingPhotoLibrary = false
    @State private var showingCamera = false
    @State private var inputImage: UIImage?
    @State private var gradingResponses: [GradingResponse] = []

    var body: some View {
        VStack(spacing: inputImage == nil ? 40 : 20) {
            Image("homework") // Use the image name without the extension
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width) // Set the frame width to the screen's width
                .clipped() // Clip the image to the bounds of the frame

            if let inputImage = inputImage {
                Image(uiImage: inputImage)
                    .resizable()
                    .scaledToFit()
            }

            if inputImage != nil {
                Button("Send") {
                    print("Send button pressed")
                }
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                .contentShape(Rectangle())
            } else {
                Button("Select Photo") {
                    showingPhotoLibrary = true
                }
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .contentShape(Rectangle())
            }

            Button(inputImage != nil ? "Retake Photo" : "Take Photo") {
                showingCamera = true
            }
            .font(.title)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(inputImage != nil ? Color.orange : Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .contentShape(Rectangle())
            .disabled(!UIImagePickerController.isSourceTypeAvailable(.camera))
        }
        .sheet(isPresented: $showingPhotoLibrary, onDismiss: processImage) {
            ImagePicker(image: $inputImage, sourceType: .photoLibrary)
        }
        .sheet(isPresented: $showingCamera, onDismiss: processImage) {
            ImagePicker(image: $inputImage, sourceType: .camera)
        }
    }
    
    func processImage() {
        // Process the image here
        guard inputImage != nil else { return }
        let dummyResponse = GradingResponse(summary: "This is a dummy response.")
        gradingResponses.append(dummyResponse)
    }
}
