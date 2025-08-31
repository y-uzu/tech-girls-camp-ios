//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// D. 四角形の中に3つのテキストを等間隔に配置（異なるアライメント）
//

import SwiftUI

struct dView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.red)
                .frame(width:300,height:150)
                .overlay(
                    VStack(spacing:40){
                        Text("Left Aligned")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment:leading
                            )
                        Text("Center Aligned")
                            .scaleEffect(1.5)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment:center)
                        Text("Right Aligned")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment:trailing)
                    })
        }
        Text("D. 四角形の中に3つのテキストを等間隔に配置（異なるアライメント）")
    }
}

#Preview {
    dView()
}
