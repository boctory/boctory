import SwiftUI

struct MainView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    Text("Under the sea!")
                        .font(.custom("Georgia-Italic", size: 32))
                        .foregroundColor(.white)
                    
                    Image("cute-jellyfish")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                            Text("사진 찾아보기")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
            }
            .onChange(of: selectedImage) { newImage in
                if newImage != nil {
                    // 갤러리 뷰로 이동
                }
            }
        }
    }
} 