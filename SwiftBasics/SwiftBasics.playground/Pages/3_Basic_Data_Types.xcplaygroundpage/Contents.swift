//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 基本的なデータ型

Swiftには、数値やテキストを表すための基本的な**データ型**が用意されています。
使うデータ型によって保存できる内容が異なります。

- **Int**: 整数を表します（例: 42, -5）
- **Double**: 小数を表します（例: 3.14, -0.001）
- **String**: テキスト（文字列）を表します（例: "こんにちは"）
- **Bool**: 真偽値（trueまたはfalse）を表します

それぞれのデータ型を見ていきましょう。
*/
import Foundation

// Int（整数型）
var age: Int = 25

// Double（小数型）
let pi: Double = 3.14159

// String（文字列型）
var message: String = "こんにちは、Swift！"
message = "こんにちは、Ruby！" // 値の変更が可能です
print(message) // "こんにちは、Ruby！"

let name = "Chris"
let greeting: String = "こんにちは、\(name)さん" // \() を使って、変数を埋め込むことができます
let fullName = name + " " + "Lattner" // + を使って文字列を連結できます
print(fullName) // Chris Lattner

// Bool（真偽型）
let isSwiftFun: Bool = true

let myFavoriteLanguage = "Swift"
let isFavorite: Bool = myFavoriteLanguage == "Swift"
print(isFavorite) // true

/*:

## 型推論
- 型の記述を省略することもできます
*/
var height = 170 // Int
var isKotlinBoring = false // Bool

//: [次のページ](@next)
