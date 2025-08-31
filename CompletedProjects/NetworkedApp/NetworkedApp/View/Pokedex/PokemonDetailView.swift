import Charts
import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonListItem
    @StateObject private var vm = PokemonDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // 画像：公式アート > 一覧スプライト > ダミー
                if let url = vm.artworkURL ?? pokemon.imageURL {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 220)
                    
                }
                
                // 名前・番号・分類
                VStack(spacing: 6) {
                    Text("#\(vm.numberText) \(pokemon.displayName)")
                        .foregroundColor(.blue)
                        .font(.custom("Avenir", size: 24))
                        .font(.largeTitle).bold()
                        .multilineTextAlignment(.center)
                    if let ja = vm.japaneseName {
                        Text(ja)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    if let genus = vm.genusJa {
                        Text(genus) // 例: たねポケモン
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                // タイプ
                if !vm.types.isEmpty {
                    HStack(spacing: 8) {
                        ForEach(vm.types, id: \.self) { t in
                            Text(typeDisplayName(t))
                                         .font(.subheadline).bold()
                                         .padding(.vertical, 6).padding(.horizontal, 10)
                                         .background(Capsule().fill(.thinMaterial)) // ← ここを変更！
                                 }
                             }
                         }
                // 基礎データ
                GroupBox("基本データ") {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Label("高さ", systemImage: "ruler")
                            Spacer()
                            Text(vm.heightText)
                        }
                        HStack {
                            Label("重さ", systemImage: "scalemass")
                            Spacer()
                            Text(vm.weightText)
                        }
                        if !vm.abilities.isEmpty {
                            VStack(alignment: .leading, spacing: 6) {
                                Label("とくせい", systemImage: "sparkles")
                                ForEach(vm.abilities, id: \.name) { a in
                                    HStack {
                                        Text(a.display)
                                        if a.isHidden {
                                            Text("（隠れ）")
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                // 種族値
                if !vm.stats.isEmpty {
                    GroupBox("種族値") {
                        VStack(spacing: 10) {
                            ForEach(vm.stats, id: \.name) { s in
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        statLabel(s.name)
                                        Spacer()
                                        Text("\(s.base)")
                                            .monospacedDigit()
                                    }
                                    ProgressView(value: Double(s.base), total: 255)
                                }
                            }
                        }
                    }
                }
                
                // 図鑑説明（日本語）
                if let flavor = vm.flavorJa {
                    GroupBox("説明") {
                        Text(flavor)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
                // 進化
                if !vm.evolution.isEmpty {
                    GroupBox("進化") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(vm.evolution, id: \.id) { evo in
                                    VStack(spacing: 8) {
                                        AsyncImage(url: evo.imageURL) { image in
                                            image.resizable().scaledToFit()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 72, height: 72)
                                        
                                        Text("#\(evo.id)")
                                            .font(.caption2).foregroundStyle(.secondary)
                                        Text(evo.name.capitalized)
                                            .font(.caption)
                                        if let ja = evo.jaName {
                                            Text(ja)
                                                .font(.caption2)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    .frame(width: 96)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .padding()
        }.background(Color(.teal))// ← 背景色を黄色に
        .navigationTitle(pokemon.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await vm.load(id: pokemon.id)
        }
    }
        
    // 表示用のラベル（最低限）
    private func typeDisplayName(_ t: String) -> String {
        // 必要なら日本語対応テーブルに差し替え
        t.capitalized
    }
    private func statLabel(_ key: String) -> Text {
        let key = switch key {
        case "hp": "HP"
        case "attack": "こうげき"
        case "defense": "ぼうぎょ"
        case "special-attack": "とくこう"
        case "special-defense": "とくぼう"
        case "speed": "すばやさ"
        default: key
        }
        let name = typeDisplayName(key)
        return Text(name).foregroundColor(.red)
    }
    private func typeColor(_ type: String) -> Color {
        switch type.lowercased() {
        case "fire": return .red
        case "water": return .blue
        case "grass": return .green
        case "electric": return .yellow
        case "psychic": return .purple
        case "ice": return .cyan
        case "rock": return .brown
        case "ground": return Color("GroundColor") // カスタムカラーもOK
        default: return .gray
        }
    }

}

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    struct AbilityItem { let name: String; let isHidden: Bool
        var display: String { name.replacingOccurrences(of: "-", with: " ").capitalized }
    }
    struct StatItem { let name: String; let base: Int }
    struct EvoItem {
        let id: Int
        let name: String
        let jaName: String?
        var imageURL: URL? {
            URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
        }
    }
    
    // 出力
    @Published var artworkURL: URL?
    @Published var japaneseName: String?
    @Published var genusJa: String?
    @Published var types: [String] = []
    @Published var abilities: [AbilityItem] = []
    @Published var stats: [StatItem] = []
    @Published var heightText: String = "-"
    @Published var weightText: String = "-"
    @Published var flavorJa: String?
    @Published var evolution: [EvoItem] = []
    
    var numberText: String = "-"
    
    // 取得
    func load(id: Int) async {
        numberText = String(id)
        do {
            async let pokemon = fetchPokemon(id: id)
            async let species = fetchSpecies(id: id)
            let (p, s) = try await (pokemon, species)
            
            // 画像
            if let art = p.sprites.other?.officialArtwork?.frontDefault,
               let url = URL(string: art) {
                artworkURL = url
                
            }
            // タイプ
            types = p.types.map { $0.type.name }
            // 能力
            abilities = p.abilities.map { AbilityItem(name: $0.ability.name, isHidden: $0.isHidden) }
            // 身長・体重（PokeAPI: dm / hg）
            heightText = String(format: "%.1f m", Double(p.height) / 10.0)
            weightText = String(format: "%.1f kg", Double(p.weight) / 10.0)
            // 種族値
            stats = p.stats.map { StatItem(name: $0.stat.name, base: $0.baseStat) }
            // 日本語名・分類・説明
            japaneseName = s.names.first(where: { $0.language.name == "ja-Hrkt" })?.name
                ?? s.names.first(where: { $0.language.name == "ja" })?.name
            genusJa = s.genera.first(where: { $0.language.name == "ja-Hrkt" })?.genus
                ?? s.genera.first(where: { $0.language.name == "ja" })?.genus
            flavorJa = s.flavorTextEntries.first(where: { $0.language.name == "ja-Hrkt" })
                .map { $0.flavorText.replacingOccurrences(of: "\n", with: " ")
                                    .replacingOccurrences(of: "\u{000C}", with: " ") }
                ?? s.flavorTextEntries.first(where: { $0.language.name == "ja" })
                .map { $0.flavorText.replacingOccurrences(of: "\n", with: " ")
                                    .replacingOccurrences(of: "\u{000C}", with: " ") }
            
            // 進化
            if let evoURL = URL(string: s.evolutionChain.url) {
                let chain = try await fetchEvolutionChain(url: evoURL)
                let flat = flattenEvolution(chain.chain)
                // 日本語名も補完（軽量のため各1リクエスト。数匹なのでOK）
                var items: [EvoItem] = []
                for sp in flat {
                    let id = extractID(fromSpeciesURL: sp.url) ?? 0
                    let ja = try? await fetchSpeciesNameJa(id: id)
                    items.append(.init(id: id, name: sp.name, jaName: ja))
                }
                evolution = items
            }
        } catch {
            // 最低限、落ちずに表示を保つ
            print("Detail load error: \(error)")
        }
    }
}

// MARK: - API Models

private struct PokemonDetailDTO: Decodable {
    struct Sprites: Decodable {
        struct Other: Decodable {
            struct OfficialArtwork: Decodable {
                let frontDefault: String?
                enum CodingKeys: String, CodingKey { case frontDefault = "front_default" }
            }
            let officialArtwork: OfficialArtwork?
            enum CodingKeys: String, CodingKey { case officialArtwork = "official-artwork" }
        }
        let other: Other?
    }
    struct TypeSlot: Decodable { let slot: Int; let type: NamedURL }
    struct AbilitySlot: Decodable { let ability: NamedURL; let isHidden: Bool }
    struct Stat: Decodable { let baseStat: Int; let stat: NamedURL }
    struct NamedURL: Decodable { let name: String; let url: String }
    
    let id: Int
    let name: String
    let height: Int // decimeters
    let weight: Int // hectograms
    let types: [TypeSlot]
    let abilities: [AbilitySlot]
    let stats: [Stat]
    let sprites: Sprites
}

private struct SpeciesDTO: Decodable {
    struct NameEntry: Decodable { let language: Named; let name: String }
    struct GenusEntry: Decodable { let language: Named; let genus: String }
    struct FlavorText: Decodable { let flavorText: String; let language: Named }
    struct Named: Decodable { let name: String }
    struct Evolution: Decodable { let url: String }
    let names: [NameEntry]
    let genera: [GenusEntry]
    let flavorTextEntries: [FlavorText]
    let evolutionChain: Evolution
}

private struct EvolutionChainDTO: Decodable {
    struct ChainLink: Decodable {
        let species: Species
        let evolvesTo: [ChainLink]
        struct Species: Decodable { let name: String; let url: String }
        
        enum CodingKeys: String, CodingKey { case species; case evolvesTo = "evolves_to" }
    }
    let chain: ChainLink
}

// MARK: - Networking

private func fetchPokemon(id: Int) async throws -> PokemonDetailDTO {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
    let (data, resp) = try await URLSession.shared.data(from: url)
    guard (resp as? HTTPURLResponse)?.statusCode ?? 500 < 300 else { throw URLError(.badServerResponse) }
    let dec = JSONDecoder(); dec.keyDecodingStrategy = .convertFromSnakeCase
    return try dec.decode(PokemonDetailDTO.self, from: data)
}

private func fetchSpecies(id: Int) async throws -> SpeciesDTO {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(id)/")!
    let (data, resp) = try await URLSession.shared.data(from: url)
    guard (resp as? HTTPURLResponse)?.statusCode ?? 500 < 300 else { throw URLError(.badServerResponse) }
    let dec = JSONDecoder(); dec.keyDecodingStrategy = .convertFromSnakeCase
    return try dec.decode(SpeciesDTO.self, from: data)
}

private func fetchEvolutionChain(url: URL) async throws -> EvolutionChainDTO {
    let (data, resp) = try await URLSession.shared.data(from: url)
    guard (resp as? HTTPURLResponse)?.statusCode ?? 500 < 300 else { throw URLError(.badServerResponse) }
    let dec = JSONDecoder()
    return try dec.decode(EvolutionChainDTO.self, from: data)
}

private func fetchSpeciesNameJa(id: Int) async throws -> String? {
    let s = try await fetchSpecies(id: id)
    return s.names.first(where: { $0.language.name == "ja-Hrkt" })?.name
        ?? s.names.first(where: { $0.language.name == "ja" })?.name
}

// 進化チェーンを一次元に
private func flattenEvolution(_ link: EvolutionChainDTO.ChainLink) -> [(name: String, url: String)] {
    var result: [(String, String)] = [(link.species.name, link.species.url)]
    for next in link.evolvesTo {
        result.append(contentsOf: flattenEvolution(next))
    }
    return result
}

// species URL から ID を抽出
private func extractID(fromSpeciesURL url: String) -> Int? {
    guard
        let comps = URL(string: url)?.pathComponents.reversed(),
        let idStr = comps.first(where: { Int($0) != nil }),
        let n = Int(idStr)
    else { return nil }
    return n
}

