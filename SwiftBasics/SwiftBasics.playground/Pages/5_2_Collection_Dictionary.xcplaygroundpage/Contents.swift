//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# コレクション
*/
import Foundation

/*:
## 辞書 (Dictionary)
- キーと値のペアを格納します。各値には対応するキーを使ってアクセスします。
- 順序は保証されません。
 */
// 辞書の例
var capitals: [String: String] = [
    "日本": "東京",
    "アメリカ": "ワシントンD.C.",
    "フランス": "パリ"
]

print(capitals) // 繰り返し実行してみると、順番が保証されないことがわかります👀

// 辞書に新しいキーと値を追加
capitals["イギリス"] = "ロンドン"
//print(capitals)

// 辞書の要素にアクセスすることができます
if let capitalOfJapan = capitals["日本"] {
    print("日本の首都は \(capitalOfJapan) です")
}
//: [次のページ](@next)
