# SwiftUI Challenge ヒント集

## A. 縦に3つの色付き長方形を等間隔で配置
- 垂直方向に配置するには `VStack` を使用します。
- 長方形を作るには `Rectangle` を使いましょう。
- 色をつけるには `.fill()` 修飾子を使用します。
- 間隔を調整するには `VStack` の `spacing` パラメータを設定します。
- サイズを指定するには `.frame(width: , height:)` を使用します。

---

## B. 二重に丸を配置
- 重ねて配置するには `ZStack` を使用します。
- 丸を作るには `Circle` を使いましょう。
- 色をつけるには `.fill()` 修飾子を使用します。
- サイズを調整するには `.frame(width: , height:)` を使用します。
- 内側の丸を外側より小さくし、色を変えると二重の丸ができます。

---

## C. テキストを四角形の左下に配置
- 重ねて配置するには `ZStack` を使用します。
- 配置を調整するには `ZStack` の `alignment` パラメータを設定します。
  - 左下に配置するには `.bottomLeading` を指定します。
- 四角形を作るには `Rectangle` を使いましょう。
- テキストの色を変えるには `.foregroundColor()` を使用します。
- テキストと四角形の間に余白を追加するには `.padding()` を使います。

---

## D. 四角形の中に3つのテキストを等間隔に配置（異なるアライメント）
- 四角形を背景にするには `Rectangle` を使用します。
- 四角形に別のビューを重ねるには `.overlay` 修飾子を使います。
- 垂直方向に要素を配置するには `VStack` を使用します。
- テキストのアライメントを調整するには `.frame(maxWidth: .infinity, alignment:)` を使いましょう。
  - 左寄せには `.leading` を指定。
  - 中央寄せには `.center` を指定。
  - 右寄せには `.trailing` を指定。
- テキスト同士の間隔を設定するには `VStack` の `spacing` パラメータを使用します。
- テキストのスタイルを変更するには `.font()` や `.foregroundStyle()` を活用します。

---

## E. 商品アイテム
- 商品のアイテムを縦に並べるには `VStack` を使用します。
- テキストの整列は `VStack` の `alignment` を `.leading` に設定します。
- 商品画像には `AsyncImage` を使用し、サイズを調整するには `.frame(width:, height:)` を設定します。
- 角を丸くするには `.cornerRadius()` を使います。
- テキストにスタイルを適用するには `.font()` や `.foregroundColor()` を活用します。
- カード風にするには `.padding()` と `.background()` を使用し、背景色や影を追加します。
  - 影を追加するには `.shadow(color:, radius:, x:, y:)` を設定します。

