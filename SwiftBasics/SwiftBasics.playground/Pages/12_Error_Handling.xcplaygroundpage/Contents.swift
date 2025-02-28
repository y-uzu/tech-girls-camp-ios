//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# エラーハンドリングの基礎

Swiftでは、エラーが発生する可能性がある処理に対して**エラーハンドリング**を行うことができます。
エラーハンドリングを使うことで、エラーが発生した場合でも安全に処理を進めることができます。

エラーハンドリングの基本的な構文：
- `throw`：エラーを発生させる。
- `do-catch`：エラーが発生する可能性がある処理を試み、エラーが発生した場合にキャッチします。
- `try`：エラーが発生する可能性がある関数の呼び出しに使用します。

それでは、エラーハンドリングの基本を見ていきましょう。
*/
import Foundation

// エラーの定義
enum DivisionError: Error {
    case divideByZero
}

// エラーを投げる可能性のある関数
func divide(_ numerator: Int, by denominator: Int) throws -> Int {
    if denominator == 0 {
        throw DivisionError.divideByZero
    }
    return numerator / denominator
}

// do-catch構文でエラーハンドリング
do {
    let result = try divide(10, by: 0)
    print("割り算の結果: \(result)")
} catch DivisionError.divideByZero {
    print("エラー: 0で割ることはできません")
} catch {
    print("予期しないエラーが発生しました: \(error)")
}

//: [次のページ](@next)
