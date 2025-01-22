import SwiftUI

struct ProcessingView: View {
    let image: UIImage?
    @State private var progress: Float = 0
    @State private var showResult = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Processing...")
                    .font(.custom("Georgia-Italic", size: 32))
                    .foregroundColor(.white)
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(width: 200)
                    .tint(.white)
            }
        }
        .onAppear {
            simulateProcessing()
        }
        .fullScreenCover(isPresented: $showResult) {
            ResultView(image: image)
        }
    }
    
    private func simulateProcessing() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            progress += 0.01
            if progress >= 1.0 {
                timer.invalidate()
                showResult = true
            }
        }
    }
} 