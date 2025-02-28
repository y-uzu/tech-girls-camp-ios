# Step0: ベースとなるプロジェクトを開き、コードを確認しよう

## このプロジェクトのファイル構成

```
CoffeeApp/
├── Documents/                 # 説明用ドキュメント
│   ├── coffee_hot.json        # 利用するAPIのレスポンスJSON例
│   ├── Step0/                 # ワークショップのStep 0に対応する資料
│   ├── Step1/                 # ワークショップのStep 1に対応する資料
│   ├── Step2/                 # ワークショップのStep 2に対応する資料
│   ├── Step3/                 # ワークショップのStep 3に対応する資料
│   ├── Step4/                 # ワークショップのStep 4に対応する資料
│   └── Step5/                 # ワークショップのStep 5に対応する資料
├── Preview Content/           # Xcode用のプレビューコンテンツ
├── Assets.xcassets/           # アセットファイル
├── Coffee.swift               # Coffee構造体（最初は空）
├── CoffeeApp.swift            # アプリのエントリーポイント（最初は空）
├── CoffeeDetailView.swift     # Coffee詳細画面のコード（最初は空）
├── CoffeeItemView.swift       # Coffee説明セルのコード（すでに記述済み）
├── CoffeeListView.swift       # Coffee一覧画面のコード（最初は空）
└── MainTabView.swift          # タブビューの実装コード（最初は空）

```

## 説明のポイント

### Documents/
- ワークショップの進行に必要な資料やサンプルを格納。
- `coffee_hot.json`でAPIのレスポンス例を提供し、APIの仕様を明示的に理解するために利用
- `Step0`～`Step5`に分けて、各ステップで必要なガイドや補足情報を記述

### コードの初期状態
- **`Coffee.swift`、`CoffeeApp.swift`、`CoffeeDetailView.swift`など**
  - 空の状態で提供されるファイルは、ワークショップ中に実装

### すでに記述済みのコード
- **`CoffeeItemView.swift`**
  - すでに動いているViewが既述されています
  - このファイルを元に各Stepで機能を追加していきます
