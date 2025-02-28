import SwiftUI

struct ViewModifier: View {
    @State private var sliderValue: Double = 0.5 // Slider用のプロパティ
    @State private var toggleValue: Bool = true // Toggle用のプロパティ
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 50) {
                
                // テキスト
                Text("Text: ここにテキストを表示します")
                    .font(.title) // フォントサイズとスタイルを設定
                    .foregroundColor(.blue) // テキストの色
                    .padding() // 内側に余白
                    .background(Color.yellow) // 背景色
                    .cornerRadius(10) // 背景の角を丸くする
                    .shadow(color: .gray, radius: 5, x: 2, y: 2) // 影の追加
                
                Divider()
                
                // Text で利用できる特別なModifierの紹介
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Baseline Offset
                    Text("Baseline Offset")
                        .baselineOffset(10) // テキストのベースラインを上げる
                        .background(Color.yellow)
                    
                    // Kerning
                    Text("Kerning: 文字間隔を広げます")
                        .kerning(5) // 文字の間隔を広げる
                    
                    // Tracking
                    Text("Tracking: 文字間隔（広域調整）")
                        .tracking(10) // 文字間隔の全体調整
                    
                    // Line Limit
                    Text("Line Limit: 最大行数を指定")
                        .lineLimit(1) // 最大行数を1行に制限
                        .frame(width: 150) // 幅を制限して表示を切る
                    
                    // Multiline Text Alignment
                    Text("Multiline Text Alignment: テキストを左寄せに\n複数行のテキスト")
                        .multilineTextAlignment(.leading) // 複数行のテキストの整列
                        .frame(width: 200) // 幅を制限
                }
                
                Divider()
                
                // 画像
                Image(systemName: "star.fill")
                    .resizable() // サイズを変更可能に
                    .frame(width: 50, height: 50) // サイズ指定
                    .foregroundColor(.orange) // 色を指定
                    .shadow(color: .gray, radius: 5, x: 2, y: 2) // 影の追加
                
                Divider()
                
                // 四角形
                Rectangle()
                    .fill(Color.green) // 塗りつぶしの色
                    .frame(width: 100, height: 50) // サイズ指定
                    .cornerRadius(10) // 角を丸くする
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // 影の追加
                
                Divider()
                
                // 丸
                Circle()
                    .stroke(Color.red, lineWidth: 4) // 枠線の色と幅
                    .frame(width: 100, height: 100) // サイズ指定
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // 影の追加
                
                Divider()
                
                // 楕円
                Ellipse()
                    .fill(Color.purple) // 塗りつぶしの色
                    .frame(width: 150, height: 75) // サイズ指定
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // 影の追加
                
                Divider()
                
                // カプセル
                Capsule()
                    .fill(Color.orange) // 塗りつぶしの色
                    .frame(width: 150, height: 50) // サイズ指定
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // 影の追加
                
                Divider()
                
                // ボタン
                Button(action: {
                    print("ボタンが押されました")
                }) {
                    Text("ボタンを押してください")
                        .font(.headline) // ボタンのテキストのスタイル
                        .foregroundColor(.white) // テキストの色
                        .padding() // 内側に余白
                        .background(Color.blue) // 背景色
                        .cornerRadius(10) // 背景の角を丸くする
                        .shadow(color: .gray, radius: 5, x: 2, y: 2) // 影の追加
                }
                
                Divider()
                
                // スライダー
                VStack(alignment: .leading) {
                    Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                        .font(.subheadline)
                    Slider(value: $sliderValue, in: 0...1)
                        .padding() // スライダー周囲に余白
                        .accentColor(.green) // スライダーの色
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                
                Divider()
                
                // トグル
                VStack(alignment: .leading) {
                    Text(toggleValue ? "Toggle is ON" : "Toggle is OFF")
                        .font(.subheadline)
                    Toggle("トグルスイッチ", isOn: $toggleValue)
                        .toggleStyle(SwitchToggleStyle(tint: .green)) // トグルのスタイルを設定
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                
                Divider()
                
                // プログレスビュー
                ProgressView("読み込み中...")
                    .progressViewStyle(CircularProgressViewStyle()) // 円形スタイル
                    .padding() // プログレスビュー周囲に余白
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            .padding()
        }
    }
}

#Preview {
    ViewModifier()
}
