# Step 3 - API経由で情報を取得して表示する

## 🎯 目的
Step 2 では、手書きのデータを `coffees` 配列に入れて、それを `ForEach` でリストに表示しました。  
しかし、実際のアプリでは、サーバー（クラウド）からデータを取得して表示することが一般的です。  

このステップでは、**インターネットを使って、サーバー上のデータを取得し、リストに表示する方法** を学びます。

---

## 📌 何をするの？
1. **`Coffee` 構造体を更新する**
   - API（サーバー）から受け取るデータを扱えるように変更
2. **`getCoffees()` メソッドを作る**
   - サーバーからデータを取得するための関数を実装
3. **画面が表示されたときにデータを取得する**
   - `.task {}` を使って、画面が表示されたら自動で `getCoffees()` を実行
4. **取得したデータをリストに表示する**
   - `@State` を使ってリストを動的に更新する

---

## 🤔 APIって何？
API（エーピーアイ）とは、**アプリとサーバーがデータをやり取りするための仕組み** です。  

今回のワークショップでは、以下の **サンプルAPI** を使います。

```
https://api.sampleapis.com/coffee/hot
```

このURLにアクセスすると、次のような **JSONデータ** が取得できます。

```json
[
    {
        "id": 1,
        "title": "Black Coffee",
        "description": "Simple and classic.",
        "ingredients": ["Coffee"],
        "image": "https://example.com/images/coffee1.jpg"
    },
    {
        "id": 2,
        "title": "Latte",
        "description": "Smooth and creamy.",
        "ingredients": ["Espresso", "Milk"],
        "image": "https://example.com/images/coffee2.jpg"
    }
]
```

🔹 **JSON（ジェイソン）とは？**  
JSON は **データの形（フォーマット）** のひとつです。  
- 文章のように見えますが、実は **プログラムが読みやすい形式** になっています。
- Swift の `Dictionary` や `Array` に変換することで、アプリで使えるようになります。

---

## ✅ APIからデータを取得する流れ
APIを使ってデータを取得するには、次の手順が必要です。

1. **`Coffee.swift` にある `Coffee` 構造体を `Decodable` に対応させる**
   - APIから取得したデータを `Coffee` の形に変換できるようにする
2. **`getCoffees()` 関数を作る**
   - API からデータを取得し、`Coffee` に変換する関数を作る
3. **`CoffeeListView.swift` を更新する**
   - `.task {}` を使って、データを取得し、リストを更新する
4. **取得したデータを `@State` で管理**
   - `@State` を使ってリストを動的に更新する

---

## 🛠 実装手順

### 1. `Coffee` 構造体を更新する
まず、`Coffee.swift` にある `Coffee` 構造体を修正し、  
APIのデータを受け取れるように `Decodable` を追加します。
(なお、今回はすでにDecodableになっています。)

**編集するファイル: `Coffee.swift`**

```swift
import SwiftUI

struct Coffee: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
```

🔹 **ポイント**
- `Decodable` を追加すると、JSON を `Coffee` に自動で変換できるようになります。
- `image` には **URL型** を使い、画像のリンクを扱えるようにします。

---

### 2. `getCoffees()` メソッドを作成する
APIからデータを取得する関数 `getCoffees()` を **`CoffeeListView.swift` の中に作成** します。

**編集するファイル: `CoffeeListView.swift`**  
1. `CoffeeListView` の中に、次のメソッドを追加してください。

```swift
func getCoffees() async throws -> [Coffee] {
    guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return [] }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let coffees = try JSONDecoder().decode([Coffee].self, from: data)
    
    return coffees
}
```

🔹 **このコードの意味**
1. `URL(string:)` で APIのURL を作成
2. `URLSession.shared.data(from:)` で **サーバーからデータを取得**
3. `JSONDecoder().decode([Coffee].self, from: data)` で **データを `Coffee` に変換**
4. 取得した `Coffee` のリストを返す

---

### 3. `CoffeeListView.swift` を更新する
画面表示時に `getCoffees()` を実行し、取得したデータをリストに表示します。

**編集するファイル: `CoffeeListView.swift`**

```swift
import SwiftUI

struct CoffeeListView: View {
    @State private var coffees: [Coffee] = []

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(coffees) { coffee in
                    CoffeeItemView(coffee: coffee)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .task {
            do {
                coffees = try await getCoffees()
            } catch {
                print("Failed to fetch coffees: \(error)")
            }
        }
    }
}

#Preview {
    CoffeeListView()
}
```

🔹 **追加したポイント**
- `@State private var coffees: [Coffee] = []`
  - 取得したデータを保存するための変数
- `.task {}` を追加
  - 画面が表示されたときに、`getCoffees()` を実行してデータを取得

---

### 4. `NetworkedApp.swift` の変更
アプリのエントリーポイントで `CoffeeListView` を使うようにします。

**編集するファイル: `NetworkedApp.swift`**

```swift
import SwiftUI

@main
struct NetworkedApp: App {
    var body: some Scene {
        WindowGroup {
            CoffeeListView()
        }
    }
}
```

---

## ✅ 完成後のコード

### `Coffee.swift`
```swift
import SwiftUI

struct Coffee: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
```

---

### `CoffeeListView.swift`
```swift
import SwiftUI

struct CoffeeListView: View {
    @State private var coffees: [Coffee] = []

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(coffees) { coffee in
                    CoffeeItemView(coffee: coffee)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .task {
            do {
                coffees = try await getCoffees()
            } catch {
                print("Failed to fetch coffees: \(error)")
            }
        }
    }
}

#Preview {
    CoffeeListView()
}
```

---

## ⏭️ 次のステップ
次は、 **リストのアイテムをタップして詳細画面へ遷移** する方法を学びます！

➡️ [Step 4 - 画面遷移する](../Step4.md)
