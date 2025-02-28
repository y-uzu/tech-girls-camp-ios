# Step2: 複数のアイテムをリスト形式で表示してみよう

## 課題の説明

**Step2**では、前のステップで作成した`CoffeeItemView`を複数表示するリストビューを構築します。  
リストはスクロール可能で、`ScrollView`と`LazyVStack`を使って効率的にアイテムを配置します。  
また、リスト表示に使うための`coffees`配列データを用意します。

---

## 目標

1. 複数のCoffeeItemViewをリスト形式で表示する。
2. ScrollViewとLazyVStackを使用して、効率的かつスクロール可能なリストを作成する。
3. Coffee構造体の配列データからリストを動的に生成する。


---

## ScrollViewとLazyVStackの説明

### ScrollView
- スクロール可能なコンテンツを表示するためのコンテナビュー。
- **特徴**:
  - 子ビューが画面に収まりきらない場合にスクロールできる。
  - 垂直方向（`vertical`）または水平方向（`horizontal`）にスクロール可能。

### LazyVStack
- 縦方向（垂直）のリストを効率的に表示するためのビュー。
- **特徴**:
  - 表示されている範囲のアイテムだけをメモリにロードする。
  - リストが大きくなってもパフォーマンスが低下しにくい。


---

## ヒント

1. `coffees`配列を作成する
   - 複数の`Coffee`オブジェクトを格納する配列を`CoffeeListView`内に用意します。
    - 例:
    ```swift
    let coffees = [
        Coffee(id: 1, title: "Black Coffee", description: "Simple and classic.", ingredients: ["Coffee"], image: URL(string: "https://example.com/coffee1.jpg")!),
        Coffee(id: 2, title: "Latte", description: "Smooth and creamy.", ingredients: ["Espresso", "Milk"], image: URL(string: "https://example.com/coffee2.jpg")!),
        Coffee(id: 3, title: "Cappuccino", description: "Rich and foamy.", ingredients: ["Espresso", "Milk Foam"], image: URL(string: "https://example.com/coffee3.jpg")!)
    ]
    ```

2. `ScrollView` でスクロール可能にする
    - アイテムが画面に収まりきらない場合にスクロールできるコンテナビューです。
    - 例:
    ```swift
    ScrollView {
        // 中にスクロールするコンテンツを配置
    }
    ```

3. `LazyVStack` で効率的に配置する
    - `LazyVStack` は、縦方向にリストを効率よく配置するビューです。
    - 表示範囲外のビューはメモリに保持されず、必要になったときに生成されます。
    - 例:
    ```swift
    LazyVStack(spacing: 20) {
        // 縦方向に間隔を20ポイントで配置
    }
    ```

4. **`ForEach`で動的にビューを生成**
   - `coffees`配列を`ForEach`でループし、各`Coffee`オブジェクトに対応する`CoffeeItemView`を表示します。
   - 配列データ（coffees）をループして、それぞれのアイテムを表示します。
   - `Identifiable` プロトコルを実装した構造体を使うことで、簡単にループできます。
   - 例:
   ```swift
    ForEach(coffees) { coffee in
        CoffeeItemView(coffee: coffee)
    }
   ```


---


## 実装手順

### 1: `coffees`配列の作成

- 複数の`Coffee`オブジェクトを含む配列を`CoffeeListView`内に定義します。

```swift
let coffees: [Coffee] = [
    Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887")!
    ),
    Coffee(
        id: 2,
        title: "Latte",
        description: "Smooth and creamy.",
        ingredients: ["Espresso", "Milk"],
        image: URL(string: "https://images.unsplash.com/photo-1498804103079-a6351b050096?auto=format&fit=crop&q=80&w=1887")!
    ),

    ...
]
```

---

### 2: `CoffeeListView`を作成

- `ScrollView`と`LazyVStack`を利用して、`coffees`配列からアイテムを動的に生成します。

---

## 完成後のコード

### `CoffeeListView`

```swift
import SwiftUI

struct CoffeeListView: View {
    let coffees: [Coffee] = [
        Coffee(
            id: 1,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        ),
        Coffee(
            id: 2,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        ),
        Coffee(
            id: 3,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        ),
        Coffee(
            id: 4,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        ),
        Coffee(
            id: 5,
            title: "Black Coffee",
            description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt.",
            ingredients: ["Coffee"],
            image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        ),
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

### `CoffeeItemView`

```swift
import SwiftUI

struct CoffeeItemView: View {
    let coffee: Coffee
    
    @State var isFavorite: Bool = false
    
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
                HStack {
                    Text(coffee.title)
                        .font(.title)
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                    }
                    
                }
                Text(coffee.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack {
                    ForEach(coffee.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.5))
            .background(.ultraThinMaterial)
        }
        .cornerRadius(10)
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
    CoffeeItemView(coffee: coffee)
        .padding()
}
```

```swift
import SwiftUI

@main
struct CoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            CoffeeListView()
        }
    }
}
```

