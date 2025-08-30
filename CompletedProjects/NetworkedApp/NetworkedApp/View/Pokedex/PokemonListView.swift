import SwiftUI

// MARK: - Models

struct PokemonListResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
}

struct PokemonListItem: Identifiable, Decodable {
    var id: Int {
        guard
            let comps = URL(string: url)?.pathComponents.reversed(),
            let idStr = comps.first(where: { Int($0) != nil }),
            let n = Int(idStr)
        else { return 0 }
        return n
    }
    let name: String
    let url: String
    var imageURL: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
    var displayName: String { name.capitalized }
}

// Pokemon-species API のレスポンス用
struct PokemonSpeciesResponse: Decodable {
    struct NameEntry: Decodable {
        let language: Language
        let name: String
    }
    struct Language: Decodable {
        let name: String
    }
    let names: [NameEntry]
}


// MARK: - Views

struct PokemonListView: View {
    @State private var pokemons: [PokemonListItem] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            Group {
                if isLoading && pokemons.isEmpty {
                    ProgressView("読み込み中…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "wifi.exclamationmark").font(.largeTitle)
                        Text("読み込みに失敗しました").font(.headline)
                        Text(errorMessage).font(.footnote).foregroundStyle(.secondary)
                        Button {
                            Task { await load() }
                        } label: {
                            Label("再試行", systemImage: "arrow.clockwise")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(pokemons) { p in
                        NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                            PokemonRow(pokemon: p)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("ポケモン図鑑")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable { await load() }
            .task { if pokemons.isEmpty { await load() } }
        }
    }
    
    // MARK: - Methods
    func load(limit: Int = 1302) async {
        isLoading = true
        errorMessage = nil
        do {
            let list = try await getPokemons(limit: limit)
            pokemons = list
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func getPokemons(limit: Int) async throws -> [PokemonListItem] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)") else { return [] }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let decoded = try JSONDecoder().decode(PokemonListResponse.self, from: data)
        return decoded.results
    }
}

struct PokemonRow: View {
    var pokemon: PokemonListItem
    @State private var japaneseName: String?

    var body: some View {
        HStack(spacing: 12) {
            if let url = pokemon.imageURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().frame(width: 44, height: 44)
                    case .success(let image):
                        image.resizable().scaledToFit().frame(width: 44, height: 44)
                    case .failure:
                        Image(systemName: "photo").frame(width: 44, height: 44)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("#\(pokemon.id) \(pokemon.displayName)")
                    .font(.body)
                if let ja = japaneseName {
                    Text(ja)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .task {
            japaneseName = try? await getJapaneseName(for: pokemon.id)
        }
    }
    
    func getJapaneseName(for id: Int) async throws -> String? {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(id)/") else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(PokemonSpeciesResponse.self, from: data)
        // "ja-Hrkt" がひらがな日本語、"ja" が漢字カタカナ
        if let entry = decoded.names.first(where: { $0.language.name == "ja-Hrkt" }) {
            return entry.name
        } else if let entry = decoded.names.first(where: { $0.language.name == "ja" }) {
            return entry.name
        }
        return nil
    }
}

#Preview {
    PokemonListView()
}
