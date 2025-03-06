# Step 2 - ForEach を使ってリストを整理する

## 目的
Step 1 では、5つの `CoffeeItemView` を **1つずつ手書き** で並べました。  
しかし、実際のアプリでは **数十個、数百個のデータ** を表示することがあります。  
手作業で1つずつ書くのは大変なので、**ForEach を使ってリストを自動生成** する方法を学びます。  

---

## 📌 やること
- `coffees` 配列を作成し、すべてのデータを **1つの変数で管理**
- `ForEach` を使い、**リストをシンプルに記述**
- `LazyVStack` 内で `ForEach` を利用し、**コードの重複をなくす**
- **データの追加・変更を簡単にする**

---

## 🤔 なぜ ForEach を使うのか？
現在の `CoffeeListView` では、次のように **同じようなコードを繰り返し書いています**。

```swift
CoffeeItemView(coffee: coffee1)
    .padding(.horizontal)

CoffeeItemView(coffee: coffee2)
    .padding(.horizontal)

CoffeeItemView(coffee: coffee3)
    .padding(.horizontal)

CoffeeItemView(coffee: coffee4)
    .padding(.horizontal)

CoffeeItemView(coffee: coffee5)
    .padding(.horizontal)
```

この方法には **2つの問題** があります。

1. **コードの重複が多い**  
   - ほぼ同じコードを何度も書いているため、追加・修正が大変です。

2. **データの変更が面倒**  
   - 新しいコーヒーを追加するたびに、1行ずつ手作業でコードを追加しなければなりません。

---

## ✅ ForEach を使うとどうなる？
SwiftUI の `ForEach` を使うと、次のように **1行のコードでリストを自動生成** できます。

```swift
ForEach(coffees) { coffee in
    CoffeeItemView(coffee: coffee)
        .padding(.horizontal)
}
```

このコードは、`coffees` 配列の **すべてのデータを自動で処理** し、  
**1つずつ `CoffeeItemView` に渡して表示** してくれます。

これにより、**新しいコーヒーを追加するときは、配列にデータを増やすだけ！**  
コードを手作業で増やす必要がなくなります。

---

## 🛠 実装手順

### 1. `coffees` 配列を作成する
Step 1 では、`coffee1` 〜 `coffee5` の **5つの変数** を用意しました。  
しかし、リストにするなら配列として管理したほうがわかりやすいです。

次のように、`coffees` という配列を作り、データをまとめます。

```swift
let coffees: [Coffee] = [
    Coffee(id: 1, title: "Black Coffee", description: "Simple and classic.", ingredients: ["Coffee"], image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887")!),
    Coffee(id: 2, title: "Latte", description: "Smooth and creamy coffee with milk.", ingredients: ["Espresso", "Milk"], image: URL(string: "https://images.unsplash.com/photo-1498804103079-a6351b050096?auto=format&fit=crop&q=80&w=1887")!),
    Coffee(id: 3, title: "Cappuccino", description: "Espresso, hot milk, and steamed milk foam.", ingredients: ["Espresso", "Milk Foam"], image: URL(string: "https://images.unsplash.com/photo-1525351484163-7529414344d8?auto=format&fit=crop&q=80&w=1887")!),
    Coffee(id: 4, title: "Mocha", description: "Espresso with chocolate and steamed milk.", ingredients: ["Espresso", "Chocolate", "Milk"], image: URL(string: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&q=80&w=1887")!),
    Coffee(id: 5, title: "Espresso", description: "Strong and rich coffee.", ingredients: ["Espresso"], image: URL(string: "https://images.unsplash.com/photo-1517705008128-361805f42e86?auto=format&fit=crop&q=80&w=1887")!)
]
```

---

### 2. `ForEach` でリストを生成
Step 1 では、1つずつ手書きで `CoffeeItemView` を追加していました。  
これを `ForEach` を使って自動化します。

```swift
LazyVStack(spacing: 20) {
    ForEach(coffees) { coffee in
        CoffeeItemView(coffee: coffee)
            .padding(.horizontal)
    }
}
```

---

### 3. `CoffeeListView` に反映
`coffees` 配列と `ForEach` を組み合わせて、リスト全体を構築します。

```swift
import SwiftUI

struct CoffeeListView: View {
    let coffees: [Coffee] = [
        Coffee(id: 1, title: "Black Coffee", description: "Simple and classic.", ingredients: ["Coffee"], image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887")!),
        Coffee(id: 2, title: "Latte", description: "Smooth and creamy coffee with milk.", ingredients: ["Espresso", "Milk"], image: URL(string: "https://images.unsplash.com/photo-1498804103079-a6351b050096?auto=format&fit=crop&q=80&w=1887")!),
        Coffee(id: 3, title: "Cappuccino", description: "Espresso, hot milk, and steamed milk foam.", ingredients: ["Espresso", "Milk Foam"], image: URL(string: "https://images.unsplash.com/photo-1525351484163-7529414344d8?auto=format&fit=crop&q=80&w=1887")!),
        Coffee(id: 4, title: "Mocha", description: "Espresso with chocolate and steamed milk.", ingredients: ["Espresso", "Chocolate", "Milk"], image: URL(string: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&q=80&w=1887")!),
        Coffee(id: 5, title: "Espresso", description: "Strong and rich coffee.", ingredients: ["Espresso"], image: URL(string: "https://images.unsplash.com/photo-1517705008128-361805f42e86?auto=format&fit=crop&q=80&w=1887")!)
    ]

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
    }
}

#Preview {
    CoffeeListView()
}
```

---

### `NetworkedApp` の変更
エントリーポイント (`NetworkedApp`) で `CoffeeListView` を使うようにします。

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

## ⏭️ 次のステップ
次のステップでは、データを **手書きではなく、APIから取得** する方法を学びます。

➡️ [Step 3 - API経由で情報を取得して表示する](./Step3.md)
