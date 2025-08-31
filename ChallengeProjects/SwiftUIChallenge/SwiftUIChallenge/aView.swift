//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// A. 縦に3つの色付き長方形を等間隔で配置
//

import SwiftUI

struct aView: View {
    var body: some View {
        VStack(spacing:20){
            Rectangle().fill(Color.red).frame(width:100,height:50)
            Rectangle().fill(Color.green).frame(width:100,height:50)
            Rectangle().fill(Color.blue).frame(width:100,height:50)
            
            
            
        }
        
    }
}

#Preview {
    aView()
}
