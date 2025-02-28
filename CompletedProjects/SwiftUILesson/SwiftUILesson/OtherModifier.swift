import SwiftUI

struct OtherModifier: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {

                // MARK: その他のModifier（一例）
                VStack(spacing: 10) {
                    Text("他によく使うModifier")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    // Opacity: 透明度の調整
                    Text("Opacity Example")
                        .opacity(0.5) // 半透明にする
                    
                    // Rotation Effect: 回転
                    Text("Rotated Text")
                        .rotationEffect(.degrees(45)) // テキストを45度回転
                    
                    // Scale Effect: 拡大縮小
                    Text("Scaled Text")
                        .scaleEffect(1.5) // テキストを1.5倍に拡大
                    
                    // Blur: ぼかし
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
                        .blur(radius: 5) // ぼかし効果を追加
                    
                    // Shadow: 影
                    Text("Shadow Effect")
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                }
            }
            .padding()

        }
    }
}

#Preview {
    OtherModifier()
}
