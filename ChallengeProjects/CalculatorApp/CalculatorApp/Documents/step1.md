# ワークショップ: 電卓アプリを作ってみよう！ - Step 1

## 最初のコード説明

ワークショップの最初の状態では、足し算電卓のUIはすでに用意されています。この段階では、ボタンを押した際の足し算ロジック（`calculateSum`メソッドの中身）がまだ実装されていません。

---

### 1. プロパティ定義

```swift
@State var firstNumber: String = ""
@State var secondNumber: String = ""
@State var result: String = "?"
```

- @State プロパティ
  - ユーザーの入力や計算結果を一時的に保存するためのプロパティです。値が変更されるとビューが再描画されます。
- firstNumber, secondNumber
  - ユーザーが入力する2つの数字を保持するための文字列型プロパティです。
- result
  - 計算結果を保持します。初期値は `"?"` です。

---

### 2. ビュー構造

```swift
VStack(spacing: 20) {
    Text("足し算電卓")
        .font(.largeTitle)
        .fontWeight(.bold)
}
```

- VStack
ビューを垂直方向に配置します。`spacing: 20` によって各要素の間隔が調整されています。

---

### 3. 入力フィールド

```swift
TextField("?", text: $firstNumber)
    .keyboardType(.numberPad)
    .frame(width: 60)
    .multilineTextAlignment(.center)
    .textFieldStyle(RoundedBorderTextFieldStyle())
```

- TextField
  - ユーザーが数値を入力するためのフィールドです。`?` はプレースホルダー（入力のヒント）として表示されます。
- keyboardType(.numberPad)
  - 数字専用のキーボードを表示します。
- textFieldStyle(RoundedBorderTextFieldStyle())
  - 入力フィールドのスタイルを角丸に変更します。

---

### 4. 計算ボタン

```swift
Button(action: {
    calculateSum()
}) {
    Text("計算する")
        .fontWeight(.bold)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
}
```

- Button
ボタンを押したときに `calculateSum()` を実行します。
- スタイル
ボタンに青色の背景、白色のテキスト、角丸のデザインを適用しています。

---

### 5. 足し算ロジックの空実装

```swift
func calculateSum() {
    // TODO: - Challenge1
    // ここに計算ロジックを記述し、計算結果を表示できるようにしてみよう
}
```

- **現在の状態**
ボタンを押しても何も起こりません。この関数に計算ロジックを実装するのが課題です。

---




## Step 1: 足し算ロジックを実装

### 手順

1. `calculateSum`メソッドを編集し、足し算のロジックを記述します。
2. 入力された2つの値を文字列から数値に変換し、足し算を実行します。
3. 結果を文字列に変換して `result` プロパティに格納します。
4. 入力が無効な場合は、`result` に `"Error"` と表示します。

### 実装の流れ

1. 入力された値を `Int` 型に変換します。
2. 変換が成功した場合、2つの数値を足し算します。
3. 結果を文字列に変換して `result` に格納します。
4. 入力が無効な場合は、エラー表示として `"Error"` を設定します。


### ポイント

#### キャスト

ここでは、`calculateSum` メソッドを完成させるために、入力された文字列を数値に変換するキャストについて詳しく説明します。

---

## キャストとは？

キャストとは、ある型（データ型）を別の型に変換する操作のことです。
例えば、この電卓アプリではユーザーが`TextField`に入力した値は文字列（`String`型）として扱われます。
しかし、計算を行うには文字列を数値（`Int`型や`Double`型など）に変換する必要があります。

Swiftでは、キャストを安全に行うための仕組みとして、特定の型に変換する初期化方法（例: `Int()`）を使用します。

---

## `Int()` を使ったキャストの仕組み

Swiftで文字列を整数に変換する際、`Int()` を使用します。
この操作は「オプショナル型」を返します。

```swift
let firstNumberInt = Int(firstNumber)
```

### 重要なポイント
1. 成功した場合:
- `Int("123")` は `123`（`Int`型の値）を返します。
2. 失敗した場合:
- `Int("abc")` や `Int("")` のような無効な入力では `nil` を返します。
- このため、変換後の値は`オプショナル型`（`Int?`型）になります。


---


## オプショナル型とは？

オプショナル型は「値が存在するかもしれないし、存在しないかもしれない」ことを表す型です。
- 値が存在する場合： その型の値が含まれる。
- 値が存在しない場合： `nil`（値が存在しないことを示す特別な状態）を取る。

例:
```swift
let validNumber = Int("123") // validNumber は Int? 型で、値は 123
let invalidNumber = Int("abc") // invalidNumber は Int? 型で、値は nil
```

---

## `if let` を使った安全なアンラップ
        
オプショナル型の値を安全に扱うために、`if let` を使用します。
これは「値が存在する場合だけ実行する」構文です。
        
例:
```swift
if let firstNumberInt = Int(firstNumber), let secondNumberInt = Int(secondNumber) {
    // 値が存在する時はこっち (= Intにキャストできた時)
    let resultInt = firstNumberInt + secondNumberInt
    result = String(resultInt)
} else {
    // 値が存在しない時はこっち (= Intにキャストできなかった時)
    result = "Error"
}
```


---

## 補足

### キャストに失敗する場合の例
- 入力フィールドが空（例: `""`）
- ユーザーが数字以外の文字を入力（例: `"abc"`, `"123abc"`）

### 改善のアイデア
- 入力時にバリデーションを追加して、ユーザーに誤入力を防ぐフィードバックを提供する。
- 小数点対応が必要な場合は、`Double()` を使用することで対応可能。



---



解答例はこちら

↓
↓
↓
↓
↓
↓
↓
↓

まずは自分で考えてみましょう

↓
↓
↓
↓
↓
↓
↓
↓

わからない場合は、解答例を参考にして良いですよ

↓
↓
↓
↓
↓
↓
↓
↓



## 解答例

### 完成コード（Step 1）

```swift
func calculateSum() {
    let firstNumberInt = Int(firstNumber)
    let secondNumberInt = Int(secondNumber)
    if let firstNumberInt, let secondNumberInt {
        let resultInt = firstNumberInt + secondNumberInt
        result = String(resultInt)
    } else {
        result = "Error"
    }
}
```

これで足し算機能が動作するようになりました！
次は引き算機能を追加していきます。

