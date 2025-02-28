//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 制御構文

*/
import Foundation

/*:
## for-in文
- 繰り返し処理を行うループ構文です。
 */

// for 文を使って配列にアクセスすることができます
let fruits = ["りんご", "みかん", "バナナ"]
for fruit in fruits {
    print(fruit) // りんご, みかん, バナナ
}

// 添字を使って for 文を書くこともできます
for i in 1...10 {
    print(i) // 1, 2, 3 ...
}

for i in 1...10 {
    if i == 5 {
        break // ループを途中で抜けることもできます
    }
    print(i) // 1, 2, 3 ...
}

// for文に似た表現で forEach を使って配列にアクセスすることもできます
fruits.forEach{ fruit in
    print(fruit) // りんご, みかん, バナナ
}

//: [次のページ](@next)
