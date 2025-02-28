import SwiftUI

struct OverlayAndBackground: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {

                // MARK: OverlayとBackgroundの活用
                VStack(alignment: .leading, spacing: 10) {
                    Text("Overlay & Background: 背景や重ね表示の調整")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    // Overlayの例
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 150, height: 100)
                        .overlay(
                            Text("Overlay")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                    
                    // Backgroundの例
                    Text("Background Example")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                        )
                    
                    // Overlay & Backgroundの組み合わせ
                    Text("Combined Example")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 3)
                        )

                }
            }
            .padding()
        }
    }
}

#Preview {
    OverlayAndBackground()
}
