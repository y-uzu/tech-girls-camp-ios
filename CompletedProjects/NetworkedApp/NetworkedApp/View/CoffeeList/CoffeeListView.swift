import SwiftUI

struct CoffeeListView: View {
    @State private var coffees: [Coffee] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(coffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                            CoffeeItemView(coffee: coffee)
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .navigationTitle("コーヒーリスト")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                do {
                    self.coffees = try await getCoffees()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
            .task {
                do {
                    self.coffees = try await getCoffees()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Methods
    func getCoffees() async throws -> [Coffee] {
        do {
            guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return [] }
            let (data, _) = try await URLSession.shared.data(from: url)
            let coffee = try JSONDecoder().decode([Coffee].self, from: data)
            dump(coffee)
            return coffee
        } catch {
            throw error
        }
    }
}

#Preview {
    CoffeeListView()
}
