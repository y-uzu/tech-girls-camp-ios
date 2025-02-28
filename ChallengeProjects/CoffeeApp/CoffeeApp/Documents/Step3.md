# Step3: バックエンドからAPI経由で情報を取得して表示してみよう

## 課題の説明

**Step3**では、バックエンドからAPI経由でコーヒーのデータを取得し、それをリストに表示する機能を実装します。  
今回は、ローディングやエラーハンドリングは省略し、シンプルにデータを取得して表示する流れを体験します。

---

## 目標

1. バックエンドのAPIから取得したデータをリスト形式で表示する。
2. 非同期処理を用いてデータを取得し、リストビューに反映する。
3. JSONデータをデコードしてCoffee構造体にマッピングする。

---

## ヒント

1. **APIリクエストの設定**
   - サンプルAPIエンドポイントを使用します（例: `https://api.sampleapis.com/coffee/hot`）。
   - 以下のようなJSONレスポンスが返ってくると仮定します：
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

2. **データを取得するメソッドの作成**
   - データを取得するメソッドを定義します。
   - メソッド例:
     ```swift
     // MARK: - Methods
     func getCoffees() async throws -> [Coffee] {
         guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return [] }
         // ここでリクエストを投げて、そのレスポンスをdataとして受け取ります
         let (data, _) = try await URLSession.shared.data(from: url)
         // 受け取ったデータ(Json)をCoffee側にデコードします
         let coffees = try JSONDecoder().decode([Coffee].self, from: data)
         return coffees
     }
     ```

3. **データ取得とビューの更新**
   - `.task {}`を使用して、画面表示時に`getCoffees`を呼び出します。
   - 非同期タスク内でデータを取得し、`@State`で管理する配列に代入します。

4. **モデルのデコード**
   - 既存の`Coffee`構造体を`Decodable`プロトコルに準拠させ、JSONデータをデコードします：
     ```swift
     struct Coffee: Identifiable, Decodable {
         let id: Int
         let title: String
         let description: String
         let ingredients: [String]
         let image: URL
     }
     ```

---

## ポイント

- **動的データの活用**
  - 取得したデータをそのままリスト表示に使用することで、バックエンドとの連携を体験できます。

- **シンプルなコード構造**
  - エラーハンドリングやローディングを省略することで、実装のハードルを下げます。


---


## 実装手順

### 1: `Coffee`構造体を更新

APIからのデータをマッピングするために、`Coffee`構造体を`Decodable`に準拠させます。  
これにより、JSONデータを直接デコードできるようになります。

```swift
struct Coffee: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
```

---

### 2: `getCoffees`メソッドを実装

非同期処理を用いて、APIからデータを取得するメソッドを作成します。  
このメソッドは、次のことを行います：
- APIエンドポイントにリクエストを送信。
- JSONレスポンスをデータとして受け取り、`Coffee`構造体の配列にデコード。

```swift
func getCoffees() async throws -> [Coffee] {
    guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return [] }
    let (data, _) = try await URLSession.shared.data(from: url)
    let coffees = try JSONDecoder().decode([Coffee].self, from: data)
    return coffees
}
```

---

### 3: リストビューを更新

非同期でデータを取得し、取得したデータをリストに表示するビューを作成します。  
以下のように、`@State`でコーヒーデータを管理し、`.task {}`でデータを取得します。

```swift
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
```

---

### 4: プレビューを確認

最後に、プレビューで表示を確認します。

```swift
#Preview {
    CoffeeListView()
}
```

---

## 完成後のコード


### `CoffeeListView`

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

    // MARK: - Methods
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
```

---

### `Coffee`

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
