# Step4: タブを利用して複数の画面を切り替えよう

## 課題の説明

**Step4**では、アプリにタブバーを追加し、複数の画面を切り替えられる機能を実装します。  
タブバーには、次の2つの画面を含めます：
1. コーヒーのリストを表示する画面（`CoffeeListView`）
2. お気に入りのコーヒーを表示する画面（仮置きで`Text("Favorites View")`）

---

## 目標

1. タブバーを追加し、複数の画面を切り替えられるようにする。
2. タブバーに各画面のアイコンとタイトルを設定する。
3. お気に入り画面を仮置きで実装する。

---

## ヒント

1. **`MainTabView`で実装**
   - タブバーを管理するための`MainTabView`に、`TabView`を使って画面を切り替える構造を実装します。

2. **`TabView`の基本構造**
   - `TabView`内で各画面を配置し、それぞれにアイコン（ex: `Image(systemName:)`）とタイトルを設定します。
   - 例:
     ```swift
     TabView {
         FirstView()
             .tabItem {
                 Image(systemName: "list.bullet")
                 Text("FirstView")
             }
         
         SecondView()
             .tabItem {
                 Image(systemName: "star.fill")
                 Text("SecondView")
             }
     }
     ```

3. **仮の画面でOK**
   - お気に入り画面はまだ実装されていないため、`Text("Favorites View")`で仮のビューを表示します。

---

## ポイント

- **簡単なタブバーの実装**
  - `TabView`を使うと、数行のコードで複数の画面を切り替える仕組みを実装できます。

- **アイコンとテキストの組み合わせ**
  - `tabItem`でアイコン（`Image(systemName:)`）とラベル（`Text`）を設定することで、直感的で分かりやすいUIを提供します。

- **画面の仮置き**
  - 実装がまだ完了していない画面は、`Text`を使って仮置きすることで進捗を可視化できます。



---


## 実装手順

### 1: `MainTabView`を作成

- `MainTabView`を新規作成し、アプリ全体のタブバーを管理するビューとして定義します。
- タブバーのアイコンを設定します：
  - **コーヒーリスト画面**：`list.bullet`
  - **お気に入り画面**：`star.fill`
- 各タブには適切なラベルを設定します（例: "Coffees", "Favorites"）。


```swift
struct MainTabView: View {
    var body: some View {
        TabView {
            CoffeeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Coffees")
                }

            Text("Favorites View") // 仮のビュー
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
        }
    }
}
```

---

### 2: `CoffeeApp`を更新

- アプリのエントリーポイントである`CoffeeApp`を更新し、初期画面として`MainTabView`を設定します。

```swift
@main
struct CoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
```


---

## 完成後のコード

### `MainTabView`

```swift
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CoffeeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Coffees")
                }

            Text("Favorites View") // 仮のビュー
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
        }
    }
}

#Preview {
    MainTabView()
}
```

---

### `CoffeeApp`

```swift
import SwiftUI

@main
struct CoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
```
