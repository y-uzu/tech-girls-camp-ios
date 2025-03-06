# Step 1: アイテムセルを複数個縦に並べる

## 目的
Step 0 では、 **1つのコーヒーアイテム** を画面に表示しました。  
しかし、実際のアプリでは **複数のアイテムをリスト形式で表示** することが一般的です。  

このステップでは、 **複数のコーヒーアイテムを縦に並べる** 方法を学びます。  

---

## 📌 やること
1. `CoffeeListView` を作成し、複数の `CoffeeItemView` を **縦に並べる**
2. **手書きのデータ** を使って、5つのコーヒーアイテムを表示
3. `ScrollView` を使って、リストをスクロール可能にする
4. `LazyVStack` を使って、効率よくアイテムを配置する
5. `CoffeeItemView` を修正し、データを外部から受け取る形にする

---

## 画面の完成イメージ
このステップが完了すると、画面に **5つのコーヒーのアイテム** が並んで表示されます。

```
+----------------------+
|   ☕  Black Coffee   |
|   Simple and hot     |
+----------------------+
|   ☕  Latte          |
|   Smooth and creamy  |
+----------------------+
|   ☕  Cappuccino     |
|   Espresso & milk    |
+----------------------+
|   ☕  Mocha          |
|   Chocolate & coffee |
+----------------------+
|   ☕  Espresso       |
|   Strong & bold      |
+----------------------+
```

<img width="300" src="../../../../docs/images/08_step1.png">

---

## 🏗 実装手順

### 1. `CoffeeListView` を作成
Step 0 では、アプリの最初の画面として `CoffeeItemView` を **1つだけ** 表示していました。  
今回は **リスト形式** にするため、新しく `CoffeeListView.swift` を作成し、`CoffeeItemView` を **5つ** 並べます。

---

### 2. `CoffeeItemView` の変更
これまでは、`CoffeeItemView` の中で **固定のコーヒー情報** を持っていました。  
しかし、リスト形式にするため、 **外部からコーヒーデータを受け取る形** に変更します。

#### **変更前の `CoffeeItemView`**
```swift
struct CoffeeItemView: View {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Simple and classic.",
        ingredients: ["Coffee"],
        image: URL(string: "https://example.com/coffee1.jpg")!
    )
```
この書き方では、**毎回同じコーヒーが表示されてしまう** ため、  
表示する内容を変えられるように変更します。

#### **変更後の `CoffeeItemView`**
```swift
struct CoffeeItemView: View {
    let coffee: Coffee
```
- `let coffee = Coffee(...)` を削除  
- `let coffee: Coffee` に変更  
- これにより、**外部からデータを受け取ることができる**

この変更に伴って、Preview の記述も変更する必要があります。

```swift
#Preview {
    let coffee1 = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )

    CoffeeItemView(coffee: coffee1)
        .padding()
}
```

---

### 3. コーヒーデータを 5 つ用意する
`CoffeeListView` の中に、**5つのコーヒーデータ** を定義します。

```swift
struct CoffeeListView: View {
    let coffee1 = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee2 = Coffee(
        id: 2,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee3 = Coffee(
        id: 3,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee4 = Coffee(
            id: 4,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        )
    let coffee5 = Coffee(
        id: 5,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
```

---

### 4. `LazyVStack` でアイテムを縦に並べる

複数のアイテムを **縦に並べる** ために、`LazyVStack` を使います。

```swift
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
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
            }
            .padding(.vertical)
        }
    }
}
```

---

### 5. `CoffeeApp.swift` を更新する
今までは **1つのコーヒーアイテム** しか表示していませんでした。  
このステップから、アプリの最初の画面を `CoffeeListView` に変更します。

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

## 🎯 Step 1 のポイント
1. **複数のアイテムを手動で並べた**
   - `CoffeeItemView` を **5つ** 画面に表示した。
2. **`ScrollView` を追加**
   - **スクロール可能** にしたので、すべてのアイテムを表示できるようになった。
3. **`LazyVStack` を使った**
   - アイテムが **縦に並ぶように配置** した。
4. **`CoffeeItemView` を変更**
   - 外部から `Coffee` のデータを受け取るようにした。

---

## ✅ 完成後のコード

### `CoffeeItemView.swift`
```swift
import SwiftUI

struct CoffeeItemView: View {
    let coffee: Coffee

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: coffee.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 10) {
                Text(coffee.title)
                    .font(.title)

                Text(coffee.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .cornerRadius(10)
    }
}

#Preview {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Simple and classic.",
        ingredients: ["Coffee"],
        image: URL(string: "https://example.com/coffee1.jpg")!
    )
    CoffeeItemView(coffee: coffee)
}
```

---

### `CoffeeListView.swift`
```swift
import SwiftUI

struct CoffeeListView: View {
    let coffee1 = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee2 = Coffee(
        id: 2,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee3 = Coffee(
        id: 3,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
    let coffee4 = Coffee(
            id: 4,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        )
    let coffee5 = Coffee(
        id: 5,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
   
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
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

### `NetworkedApp.swift`
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

## 🔜 次のステップ
現在は、コーヒーアイテムを **手動で 5つ** 並べています。
次のステップでは、 **`ForEach` を使って自動的にリストを作成** できるようにします！

➡️ [Step 2 - ForEach を使ってリストを整理する](./Step2.md)
