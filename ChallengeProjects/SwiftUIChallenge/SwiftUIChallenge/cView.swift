//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// C. テキストを四角形の左下に配置
//

import SwiftUI

struct cView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .fill(Color.green)
                .frame(width:200, height: 100)
            Text("Bottom Left")
                .foregroundColor(.white)
                .padding()
        }
        
        Text("C. テキストを四角形の左下に配置")
    }
}

#Preview {
    cView()
}
