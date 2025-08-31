import SwiftUI

@main
struct NetworkedApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView() // ← ここを変更（アプリ起動時に `MainTabView` を表示）
        }
    }
}
