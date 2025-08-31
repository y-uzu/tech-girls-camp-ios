import SwiftUI

struct CoffeeListView: View {
    @State private var coffees: [Coffee] = [] // サーバーから取得するコーヒー一覧データ

    var body: some View {
        NavigationStack { // ← NavigationStackを追加して画面遷移を管理
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(coffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                            // ← アイテムをタップすると詳細画面へ遷移
                            CoffeeItemView(coffee: coffee)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Coffees") // ← 画面上部にタイトルを追加
        }
        .task {
            do {
                coffees = try await getCoffees()
            } catch {
                print("Failed to fetch coffees: \(error)")
            }
        }
    }

    // MARK: - APIデータ取得メソッド
    func getCoffees() async throws -> [Coffee] {
        guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let coffees = try JSONDecoder().decode([Coffee].self, from: data)
        return coffees
    }
}

#Preview {
    CoffeeListView()
}
