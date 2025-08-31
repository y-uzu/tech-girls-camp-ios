import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // コーヒーリスト画面
            CoffeeListView()
                .tabItem {
                    Image(systemName: "list.bullet") // タブのアイコン
                    Text("Coffees") // タブのラベル
                }

            // お気に入り画面（仮置き）
            Text("Favorites View")
                .tabItem {
                    Image(systemName: "star.fill") // タブのアイコン
                    Text("Favorites") // タブのラベル
                }
        }
    }
}

#Preview {
    MainTabView()
}
