//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# コレクション

Swiftには、複数の値をまとめて管理するための**コレクション**と呼ばれるデータ型があります。


- **配列 (Array)**: 順序を持った値のリストを格納します。各要素にはインデックス（位置番号）でアクセスします。
- **辞書 (Dictionary)**: キーと値のペアを格納します。各値には対応するキーを使ってアクセスします。
- **セット (Set)**: 値の重複と順序のないコレクションです。

*/
import Foundation

/*:
## 配列 (Array)
- 順序を持った値のリストを格納します。各要素にはインデックス（位置番号）でアクセスします。
 */

// 配列の例
var fruits: [String] = ["りんご", "みかん", "バナナ"]

fruits.append("ぶどう") // 配列に要素を追加することができます
print(fruits) // ["りんご", "みかん", "バナナ", "ぶどう"]

// 配列の数を取得できます
let fruitsCount = fruits.count
print(fruitsCount) // 4
print("果物は \(fruitsCount) 個あります")

// 配列の要素にアクセス
let firstFruit = fruits[0]
print("最初の果物は \(firstFruit) です")

// ヒント：配列を扱うためのメソッドが他にも用意されています
// https://www.swiftlangjp.com/language-guide/collection-types.html#%E9%85%8D%E5%88%97arrays

//: [次のページ](@next)
