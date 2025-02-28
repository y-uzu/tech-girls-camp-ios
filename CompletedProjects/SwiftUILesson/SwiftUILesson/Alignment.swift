import SwiftUI

struct Alignment: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                
                // MARK: Alignment - frameを使ったアライメント調整
                VStack(spacing: 10) {
                    Text("Alignment: frameでのアライメント調整")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    // 左寄せ
                    Text("左寄せ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.yellow)
                    
                    // 中央寄せ
                    Text("中央寄せ")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(.green)
                    
                    // 右寄せ
                    Text("右寄せ")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .background(.orange)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Alignment()
}
