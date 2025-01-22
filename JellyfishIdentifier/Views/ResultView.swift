import SwiftUI

struct ResultView: View {
    let image: UIImage?
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Lions mane jellyfish!")
                    .font(.custom("Georgia-Italic", size: 32))
                    .foregroundColor(.white)
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                
                Text("Information")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("The Lion's Mane Jellyfish (Cyanea capillata) is one of the largest jellyfish species, known for its massive bell, long tentacles that can reach up to 30 meters, and its ability to sting with venom to capture prey in cold northern ocean waters.")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: {
                    // 메인 화면으로 돌아가기
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
            .padding()
        }
    }
} 