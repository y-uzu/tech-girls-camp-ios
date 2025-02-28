# Step5: アイテムをタップしたらアイテム詳細画面へ遷移してみよう

## 課題の説明

**Step5**では、`CoffeeItemView`をタップすると詳細画面に遷移する機能を実装します。  
詳細画面には選択されたアイテムの情報（タイトル、説明、材料など）を表示します。  
画面遷移には`NavigationStack`と`NavigationLink`を使用します。


---


## 目標

1. リスト内のアイテムをタップすると、詳細画面が表示されるようにする。
2. 詳細画面には、選択されたアイテムの情報（タイトル、説明、材料）を表示する。
3. `NavigationStack` と `NavigationLink` を使用してスムーズな画面遷移を実現する。


---

## `NavigationStack` と `NavigationLink` の説明

### NavigationStack
- 役割:
  - 画面遷移の階層構造を管理するためのコンテナ。
  - 親画面から子画面への遷移や、戻るボタンの操作を自動でサポートします。
- 使い方:
  - 他のビューを`NavigationStack`内に配置するだけで、簡単に遷移可能な構造を作れます。
  - 例:
    ```swift
    NavigationStack {
        Text("This is the main view")
    }
    ```

### NavigationLink
- 役割:
  - タップなどのアクションで別のビューに遷移するリンクを作成。
  - 遷移先のビューを`destination`パラメータで指定します。
- 使い方:
  - タップ可能な要素（例: `Text`, `Button`など）を`NavigationLink`でラップして使用します。
  - 例:
    ```swift
    NavigationStack {
        NavigationLink(destination: Text("Detail View")) {
            Text("Go to Detail")
        }
        .padding()
    }
    ```

---

## ヒント

1. `NavigationStack`を追加
   - `CoffeeListView`のルートビューに`NavigationStack`を追加します。

2. `NavigationLink`を利用
   - 各`CoffeeItemView`を`NavigationLink`でラップし、遷移先に詳細画面を指定します。

3. 詳細画面を作成
   - 新しい`CoffeeDetailView`を作成し、`Coffee`オブジェクトをプロパティとして受け取ります。

---

## ポイント

- **直感的な画面遷移**
  - `NavigationStack`と`NavigationLink`を使うことで、直感的でスムーズな画面遷移を実現できます。

- **再利用性の高い詳細画面**
  - `CoffeeDetailView`を作成することで、複数の場所から同じ詳細画面を再利用できます。

- **NavigationBarのカスタマイズ**
  - `navigationTitle`や`navigationBarTitleDisplayMode`を使用して詳細画面のタイトルを設定します。

- **画面構造の整理**
  - `NavigationStack`を使うことで、画面遷移の階層構造を簡単に管理できます。


---


## 実装手順

### 1: `NavigationStack` / `NavigationLink` を追加

- `CoffeeListView`に`NavigationStack`を追加して、画面遷移を管理します。
- `CoffeeItemView`を`NavigationLink`でラップし、タップしたときに詳細画面へ遷移できるようにします。


```swift
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
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Coffees")
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

### 2: `CoffeeDetailView`を作成

- 詳細画面を表示する`CoffeeDetailView`を編集します。
- `Coffee`オブジェクトをプロパティとして受け取り、その情報を表示します。

```swift
import SwiftUI

struct CoffeeDetailView: View {
    let coffee: Coffee
    
    var body: some View {
        VStack {
            Text(coffee.title)
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(coffee.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    CoffeeDetailView(coffee: coffee)
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
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(coffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                            CoffeeItemView(coffee: coffee)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Coffees")
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

### `CoffeeDetailView`

```swift
import SwiftUI

struct CoffeeDetailView: View {
    let coffee: Coffee
    
    var body: some View {
        VStack {
            Text(coffee.title)
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(coffee.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    CoffeeDetailView(coffee: coffee)
}
```

