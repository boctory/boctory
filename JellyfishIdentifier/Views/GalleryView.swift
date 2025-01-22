import SwiftUI

struct GalleryView: View {
    @State private var selectedImage: UIImage?
    @State private var showProcessing = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("사진 선택하기")
                    .font(.headline)
                    .foregroundColor(.white)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<8) { index in
                            Image("jellyfish\(index + 1)")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    selectedImage = UIImage(named: "jellyfish\(index + 1)")
                                    showProcessing = true
                                }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showProcessing) {
            ProcessingView(image: selectedImage)
        }
    }
} 