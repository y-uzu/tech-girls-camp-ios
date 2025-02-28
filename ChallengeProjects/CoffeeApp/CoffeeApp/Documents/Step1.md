# Step1: データを意味のある塊にして表示してみよう (構造化)

## 課題の説明

現在の`CoffeeItemView`では、以下のプロパティを個別に扱っています：
- `id`（ID）
- `title`（タイトル）
- `description`（説明）
- `ingredients`（材料）
- `image`（画像URL）

これらのプロパティは、コーヒーに関連する情報としてまとめて管理することが望ましいです。
**Step1**では、これらのプロパティを`Coffee`構造体にまとめ、`CoffeeItemView`が`Coffee`オブジェクトを受け取る形にリファクタリングします。


---


## 目標

1. 個別のプロパティ（`id`, `title`, `description`, `ingredients`, `image`）を削除し、`Coffee` 構造体を利用します。
2. `CoffeeItemView` 内に `Coffee` 構造体のインスタンスを直接保持します。

---

## 実装手順

### 1: Coffee構造体を定義

`Coffee.swift` ファイルに、以下を記述します。

```swift
struct Coffee: Identifiable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
```

- **`Identifiable` を使用する理由**:  
  SwiftUIのリストや`ForEach`でユニークに識別するため。

---

### 2: Coffee構造体をViewのプロパティに持たせる

`CoffeeItemView` を以下のように変更します。

```swift
struct CoffeeItemView: View {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
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
                    .accessibilityLabel(isFavorite ? "Remove from favorites" : "Add to favorites")
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
```

---

## 実装のポイント

1. **プロパティの置き換え**  
   - 個別のプロパティ（`id`, `title` など）を削除し、`let coffee` のインスタンスにまとめます。

2. **データの定義方法**  
   - `let coffee` でサンプルデータを直接Viewに持たせることで、シンプルな構造になります。


---


## 完成コード

以下が最終的な完成形です。

```swift
struct Coffee: Identifiable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
```


```swift
import SwiftUI

struct CoffeeItemView: View {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )
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
                    .accessibilityLabel(isFavorite ? "Remove from favorites" : "Add to favorites")
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
    CoffeeItemView()
        .padding()
}
```
