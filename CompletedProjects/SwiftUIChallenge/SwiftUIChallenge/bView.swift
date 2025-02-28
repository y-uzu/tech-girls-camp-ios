//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// B. 二重に丸を配置
//

import SwiftUI

struct bView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
            Circle()
                .fill(.orange)
                .frame(width: 75, height: 75)
        }
    }
}

#Preview {
    bView()
}
