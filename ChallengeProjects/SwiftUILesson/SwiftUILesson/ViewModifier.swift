import SwiftUI

import SwiftUI

struct ViewModifier: View {
    @State private var sliderValue: Double = 0.5 // Slider用のプロパティ
    @State private var toggleValue: Bool = true // Toggle用のプロパティ

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 50) {
                // テキスト
                Text("Text: ここにテキストを表示します")
                // 試してみるModifier:
                // .font(), .foregroundColor(), .padding(), .background(), frame() など
                // Textで利用できる特別なModifier:
                
                
                // 画像
                Image(systemName: "star.fill")
                // 試してみるModifier:
                // .resizable(), .frame(), .foregroundColor(), .aspectRatio() など
                
                // 四角形
                Rectangle()
                // 試してみるModifier:
                // .fill(), .frame(), .cornerRadius(), .shadow() など
                
                // 丸
                Circle()
                // 試してみるModifier:
                // .stroke(), .frame(), .foregroundColor() など
                
                // 楕円
                Ellipse()
                // 試してみるModifier:
                // .fill(), .frame() など
                
                // カプセル
                Capsule()
                // 試してみるModifier:
                // .fill(), .frame() など
                
                // ボタン
                Button(action: {
                    print("ボタンが押されました")
                }) {
                    Text("ボタンを押してください")
                }
                // 試してみるModifier:
                // .padding(), .background(), .foregroundColor(), .font(), .cornerRadius() など
                
                // スライダー
                VStack(alignment: .leading) {
                    Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                    Slider(value: $sliderValue, in: 0...1)
                        .padding()
                    // 試してみるModifier:
                    // .padding(), .accentColor()
                }
                
                // トグル
                VStack(alignment: .leading) {
                    Text(toggleValue ? "Toggle is ON" : "Toggle is OFF")
                    Toggle("トグルスイッチ", isOn: $toggleValue)
                    // 試してみるModifier:
                    // .padding(), .toggleStyle()
                }
                
                // プログレスビュー
                ProgressView("読み込み中...")
                // 試してみるModifier:
                // .padding(), .progressViewStyle()
            }
            .padding()
        }
    }
}

#Preview {
    ViewModifier()
}
