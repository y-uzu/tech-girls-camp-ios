//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 制御構文

Swiftには、条件に応じてコードの実行を分岐させたり、繰り返し処理を行うための**制御構文**が用意されています。
基本的な制御構文には、条件分岐を行う`if`文と、繰り返し処理を行う`for-in`文や`while`文があります。

*/
import Foundation

/*:
## if文
- 条件に応じてコードを分岐して実行します。
 */

let temperature = 30
if temperature > 25 {
    print("今日は暑いですね") // この行が実行されます
} else if temperature > 15 {
    print("過ごしやすい気温です")
} else {
    print("今日は寒いですね")
}

let myFavoriteDrink = "Coke"
let isCokeMyFavorite: Bool = myFavoriteDrink == "Coke"
if isCokeMyFavorite {
    print("I like Coke.")
} else {
    print("Coke isn’t really my thing.")
}

// 自由に制御構文を使って実験してみましょう

// 例:
// let score = 85
// if score >= 90 {
//     print("Excellent!")
// } else if score >= 70 {
//     print("Good job!")
// } else {
//     print("Keep trying!")
// }

//: [次のページ](@next)
