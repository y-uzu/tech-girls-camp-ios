//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// E. 商品アイテム
//

import SwiftUI

struct eView: View {
    var body: some View {
        Text("E. 商品アイテム")
        // 画像だけは最初に提示しておきます
        AsyncImage(url: URL(string: "https://picsum.photos/300/200")!)
    }
}

#Preview {
    eView()
}
