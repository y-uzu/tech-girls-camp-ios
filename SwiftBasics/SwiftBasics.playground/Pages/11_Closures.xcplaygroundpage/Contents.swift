//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# クロージャの概要

**クロージャ**は、特定の処理をひとまとまりにして変数や定数に格納できる機能です。関数と似ていますが、関数とは異なり名前が不要です。クロージャは、他の関数に引数として渡すことができ、コードの再利用性を高めるのに役立ちます。

基本的な構造：
- クロージャの基本構文： `{ (引数) -> 戻り値の型 in 処理 }`

それでは、クロージャの基本を見ていきましょう。
*/
import Foundation

// クロージャを使って、数字を二倍にする例
let double = { (number: Int) -> Int in
    return number * 2
}

// let square = { (number: Int) -> Int in
//     return number * number
// }

let result = double(5)
print("2倍にした結果: \(result)")

// クロージャを引数に取る関数の例
func applyOperation(to number: Int, operation: (Int) -> Int) -> Int {
    return operation(number)
}

// クロージャを渡して関数を実行
let doubledResult = applyOperation(to: 4, operation: double)
print("applyOperation関数で2倍にした結果: \(doubledResult)")

// クロージャを直接引数として渡す
let tripledResult = applyOperation(to: 3, operation: { (number: Int) -> Int in
    return number * 3
})
print("applyOperation関数で3倍にした結果: \(tripledResult)")

//: [次のページ](@next)
