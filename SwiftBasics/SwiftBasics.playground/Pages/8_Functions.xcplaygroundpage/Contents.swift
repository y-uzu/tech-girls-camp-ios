//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 関数の基本

Swiftでは、繰り返し使う処理を**関数**としてまとめることができます。関数を使うことで、コードの再利用が簡単になり、読みやすさも向上します。

関数は`func`キーワードを使って定義します。基本的な関数の構造は次のとおりです：

- **引数**: 関数に渡す値を指定します。
- **戻り値**: 関数が実行された後に返す値を指定します（戻り値がない場合は`Void`、または省略できます）。

それでは、関数の基本を見ていきましょう。
*/
import Foundation

// 引数と戻り値がある関数の例
func greet(name: String) -> String {
    return "こんにちは、\(name)さん！"
}

// 関数の呼び出し
let message = greet(name: "太郎")
print(message)

// 引数と戻り値がない関数の例
func sayHello() {
    print("Hello!")
}

sayHello()

// 引数が複数ある例
 func add(a: Int, b: Int) -> Int {
     return a + b
 }
 let sum = add(a: 3, b: 5)
print("合計: \(sum)") // 8

// 関数を組み合わせて使うこともできます
let mySum = add(a: add(a: 1, b: 2), b: add(a: 3, b: 4))
print(mySum) // 10


//: [次のページ](@next)
