//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// D. 四角形の中に3つのテキストを等間隔に配置（異なるアライメント）
//

import SwiftUI

struct dView: View {
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 300, height: 150)
            .overlay {
                VStack(spacing: 30) {
                    Text("Left Aligned")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Center Aligned")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("Right Aligned")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
    }
}

#Preview {
    dView()
}
